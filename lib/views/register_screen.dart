import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../views/login_screen.dart';

class RegisterScreen extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                        // Navigate to the RegisterScreen when the button is pressed
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

//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child: Image.asset(
//                     'assets/logo/logo.bg.no.png',
//                     height: 200,
//                     width: 200,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   'Create an Account',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   controller: nameController,
//                   decoration: InputDecoration(
//                     labelText: 'Name',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your name';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   controller: emailController,
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your email';
//                     }
//                     if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                       return 'Please enter a valid email';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   controller: passwordController,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     border: OutlineInputBorder(),
//                   ),
//                   obscureText: true,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your password';
//                     }
//                     if (value.length < 6) {
//                       return 'Password must be at least 6 characters';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         ref.read(authProvider.notifier).registerUser(
//                               emailController.text,
//                               passwordController.text,
//                               nameController.text,
//                               context,
//                             );
//                       }
//                     },
//                     child: Text('Register'),
//                     style: ElevatedButton.styleFrom(
//                       padding: EdgeInsets.symmetric(vertical: 16.0),
//                       textStyle: TextStyle(fontSize: 18),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
