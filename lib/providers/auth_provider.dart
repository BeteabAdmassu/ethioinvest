import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/auth_service.dart';
import '../views/home_screen.dart';

class AuthState {
  final bool isAuthenticated;
  final String? userId;
  final String? email;
  final String? name;
  final String? errorMessage;

  AuthState({
    required this.isAuthenticated,
    this.userId,
    this.email,
    this.name,
    this.errorMessage,
  });

  AuthState copyWith({
    bool? isAuthenticated,
    String? userId,
    String? email,
    String? name,
    String? errorMessage,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      userId: userId ?? this.userId,
      email: email ?? this.email,
      name: name ?? this.name,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final Ref _ref;
  late SharedPreferences _preferences;
  bool _isInitialized = false;

  AuthNotifier(this._ref, Future<SharedPreferences> preferencesFuture)
      : super(AuthState(isAuthenticated: false)) {
    preferencesFuture.then((preferences) {
      _preferences = preferences;
      _isInitialized = true;
      loadAuthState();
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
      await _ref.read(authServiceProvider).registerUser(email, password, name);
      state = state.copyWith(
          isAuthenticated: true, email: email, name: name, errorMessage: null);
      await _saveAuthState();
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
            userId: session.$id,
            email: email,
            errorMessage: null);
        await _saveAuthState();
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
    if (isAuthenticated && userId != null) {
      try {
        final session = await _ref.read(authServiceProvider).account.get();
        if (session != null) {
          state = state.copyWith(userId: session.$id);
        } else {
          state = AuthState(isAuthenticated: false);
          await _clearAuthState();
        }
      } catch (e) {
        print('Error verifying session: $e');
      }
    }
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

final authServiceProvider = Provider((ref) => AuthService());

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final preferencesFuture = SharedPreferences.getInstance();
  return AuthNotifier(ref, preferencesFuture);
});
