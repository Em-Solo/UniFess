import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unifess/pages/home_page.dart';
import 'package:unifess/pages/splash_screen.dart';
import 'package:unifess/providers/firebase_auth_providers.dart';
import 'login_page.dart';

class AuthCheckerPage extends ConsumerWidget {
  const AuthCheckerPage({super.key});

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
        return const SplashScreen();
      },
      error: (Object e, StackTrace _) {
        print(e);
        print("Could not move you to home or vice versa");
        return LoginPage();
      },
    );
  }
}
