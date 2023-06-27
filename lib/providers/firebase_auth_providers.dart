import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unifess/repositiories/auth/auth_user.dart';
import 'package:unifess/repositiories/auth/firebase_auth_service.dart';

final authStateChangesProvider = StreamProvider<User?>((ref) {
  final authService = ref.read(firebaseAuthProvider);
  return authService.authStateChange;
});

class AuthParams extends Equatable {
  const AuthParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

final createUserProvider =
    FutureProvider.family<AuthUser, AuthParams>((ref, params) async {
  final authService = ref.read(firebaseAuthProvider);
  return await authService.createUser(
      email: params.email, password: params.email);
});

final currentUserProvider = Provider<AuthUser?>((ref) {
  final authService = ref.read(firebaseAuthProvider);
  return authService.currentUser;
});

final logInProvider =
    FutureProvider.family<AuthUser, AuthParams>((ref, params) async {
  final authService = ref.read(firebaseAuthProvider);
  return await authService.signIn(
      email: params.email, password: params.password);
});

final logOutProvider = FutureProvider<void>((ref) async {
  final authService = ref.read(firebaseAuthProvider);
  await authService.logOut();
});

final sendEmailVerificationProvider = FutureProvider<void>((ref) async {
  final authService = ref.read(firebaseAuthProvider);
  await authService.sendEmailVerification();
});
