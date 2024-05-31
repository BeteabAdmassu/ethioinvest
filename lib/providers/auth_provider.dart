import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/auth_service.dart';
import '../views/home_screen.dart';
import '../models/wallet.dart';
import 'wallet_provider.dart';
import '../models/auth.dart';
import '../providers/favorites_provider.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final Ref _ref;
  late SharedPreferences _preferences;
  bool _isInitialized = false;

  AuthNotifier(this._ref, Future<SharedPreferences> preferencesFuture)
      : super(AuthState(isAuthenticated: false)) {
    preferencesFuture.then((preferences) {
      _preferences = preferences;
      _isInitialized = true;
    });
  }

  void clearErrorMessage() {
    state = state.copyWith(errorMessage: '');
  }

  Future<void> registerUser(
      String email, String password, String name, BuildContext context) async {
    try {
      if (!_isInitialized) {
        await _initializePreferences();
      }
      final authService = _ref.read(authServiceProvider);
      final Id = await authService.registerUser(email, password, name);

      state = state.copyWith(
          isAuthenticated: true, email: email, name: name, errorMessage: null);
      //After successful registration, add a wallet for the new user
      final walletNotifier = _ref.read(walletStateProvider.notifier);
      final newWallet = Wallet(userId: Id, balance: 10);
      await walletNotifier.createWallet(newWallet);
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      state = state.copyWith(errorMessage: 'Error registering user: $e');
    }
  }

  Future<void> loginUser(
      String email, String password, BuildContext context) async {
    try {
      if (!_isInitialized) {
        await _initializePreferences();
      }

      final session =
          await _ref.read(authServiceProvider).loginUser(email, password);

      if (session != null) {
        state = state.copyWith(
            isAuthenticated: true,
            userId: session.userId,
            email: email,
            errorMessage: null);

        await _saveAuthState();
        await initializeUserData();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    } catch (e) {
      state = state.copyWith(errorMessage: 'Error logging in: $e');
      print('Error logging in: $e');
    }
  }

  Future<void> loadUserData(String userId) async {
    loadAuthState();
    final walletNotifier = _ref.read(walletStateProvider.notifier);
    await walletNotifier.fetchWallets(userId);

    // Fetch favorites here
    final favoritesNotifier = _ref.read(favoritesStateProvider.notifier);
    await favoritesNotifier.fetchFavorites(userId);
  }

  Future<void> initializeUserData() async {
    final userId = await _ref.read(authServiceProvider).getUserId();
    await loadUserData(userId!);
  }

  Future<void> logoutUser(BuildContext context) async {
    try {
      if (!_isInitialized) {
        await _initializePreferences();
      }
      await _ref.read(authServiceProvider).logoutUser();
      state = state.copyWith(isAuthenticated: false, userId: null, email: null);
      await _saveAuthState();
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      print('Error logging out: $e');
    }
  }

  Future<void> loadAuthState() async {
    _preferences = await SharedPreferences.getInstance();
    final isAuthenticated = _preferences.getBool('isAuthenticated') ?? false;
    final userId = await _ref.read(authServiceProvider).getUserId();
    final email = _preferences.getString('email');
    final name = _preferences.getString('name');

    state = AuthState(
      isAuthenticated: isAuthenticated,
      userId: userId,
      email: email,
      name: name,
    );
  }

  Future<void> _saveAuthState() async {
    await _preferences.setBool('isAuthenticated', state.isAuthenticated);
    await _preferences.setString('userId', state.userId ?? '');
    await _preferences.setString('email', state.email ?? '');
    await _preferences.setString('name', state.name ?? '');
  }

  Future<void> _clearAuthState() async {
    await _preferences.remove('isAuthenticated');
    await _preferences.remove('userId');
    await _preferences.remove('email');
    await _preferences.remove('name');
  }

  Future<void> _initializePreferences() async {
    _preferences = await SharedPreferences.getInstance();
    _isInitialized = true;
  }
}

//provider
final authServiceProvider = Provider((ref) => AuthService());

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final preferencesFuture = SharedPreferences.getInstance();
  return AuthNotifier(ref, preferencesFuture);
});
