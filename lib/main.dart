import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'views/login_screen.dart';
import 'views/register_screen.dart';
import 'views/home_screen.dart';
import 'providers/auth_provider.dart';
import 'services/auth_service.dart';

final authServiceProvider = Provider((ref) => AuthService());
final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final preferencesFuture = SharedPreferences.getInstance();
  return AuthNotifier(ref, preferencesFuture);
});


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure initialization
  final prefs = await SharedPreferences.getInstance();
  final authState = prefs.getBool('isAuthenticated') ?? false;

  runApp(
    ProviderScope(
      child: MyApp(authState: authState),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool authState;

  const MyApp({super.key, required this.authState});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: authState
          ? HomeScreen()
          : LoginScreen(), // Route based on login state
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}
