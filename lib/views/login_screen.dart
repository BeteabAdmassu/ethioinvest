import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../views/register_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                'assets/logo/logo.bg.no.png',
              ),

              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () {
                  AuthService().loginUser(
                      emailController.text, passwordController.text, context);
                },
                child: Text('Sign In'),
              ),
              SizedBox(height: 16), // Add some space between the buttons
              ElevatedButton(
                onPressed: () {
                  // Navigate to the RegisterScreen when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
