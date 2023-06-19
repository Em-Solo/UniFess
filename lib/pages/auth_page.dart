import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unifess/pages/home_page.dart';
import 'package:unifess/providers/auth_page_providers.dart';
import 'login_page.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authStateChangesProvider);
    return auth.when(
      data: (User? user) {
        if (user == null) {
          return LoginPage();
        } else {
          return const HomePage();
        }
      },
      loading: () {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
      error: (Object e, StackTrace _) {
        print(e);
        print("Could not move you to home or vice versa");
        return const Text("Could not log in");
      },
    );
  }
}
