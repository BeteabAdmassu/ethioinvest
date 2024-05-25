import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../views/login_screen.dart';

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo/logo.bg.no.png',
                height: 200,
                width: 200,
              ),
              Text(
                'Welcome!',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text('Create your account',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 20),
              if (authState.errorMessage != null) ...[
                Text(
                  authState.errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 20),
              ],
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.password_outlined)),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        ref.read(authProvider.notifier).registerUser(
                            emailController.text,
                            passwordController.text,
                            nameController.text,
                            context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0CA789),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.white, // Foreground color
                          fontWeight: FontWeight.bold, // Bold text
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        //ref.read(authProvider.notifier).clearErrorMessage();
                        ref.watch(authProvider.notifier).clearErrorMessage();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: RichText(
                        text: const TextSpan(
                          text: 'Have an account? ',
                          style: TextStyle(
                            color: Colors
                                .black, // Adjust color according to your preference
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Sign in here',
                              style: TextStyle(
                                decoration:
                                    TextDecoration.underline, // Underline style
                                color: Colors.blue, // Change color to blue
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
