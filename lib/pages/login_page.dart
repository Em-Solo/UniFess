import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unifess/components/my_button.dart';
import 'package:unifess/components/my_textfield.dart';
import 'package:unifess/components/square_tile.dart';
import 'package:unifess/providers/firebase_auth_providers.dart';
import 'package:unifess/services/auth/auth_user.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // Unifess logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 50),

                // Welcome back text
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // Email text field
                MyTextField(
                  controller: emailController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // Password text field
                MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true),

                const SizedBox(height: 10),

                // forgot password text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                Consumer(
                  builder: (context, ref, child) {
                    return MyButton(
                      onTap: () {
                        final params = AuthParams(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim());

                        ref.read(logInProvider(params)).when(
                              data: (AuthUser user) {},
                              error: (Object e, _) {
                                print(e);
                                print("Could not log in");
                                return const Text("Could not log in");
                              },
                              loading: () {
                                return const Center(
                                    child: CircularProgressIndicator());
                              },
                            );
                      },
                    );
                  },
                ),

                // Signin button
                // MyButton(onTap: () {}),

                const SizedBox(height: 50),

                // or continue
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // google + apple sign in buttons
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //goole button
                    SquareTile(imagePath: 'lib/images/google.png'),

                    SizedBox(width: 10),

                    // apple button
                    SquareTile(
                      imagePath: 'lib/images/apple.png',
                    )
                  ],
                ),

                const SizedBox(height: 50),

                // not a memeber resgister now
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?'),
                    SizedBox(width: 4),
                    Text(
                      'Register now!',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
