import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'views/login_screen.dart';
import 'views/register_screen.dart';
import 'views/home_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
          : LoginScreen(), 
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}
