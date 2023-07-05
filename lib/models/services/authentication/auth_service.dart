import 'package:unifess/models/services/authentication/auth_user.dart';

abstract class AuthService {
  Future<AuthUser> createUser({
    required String email,
    required String password,
  });

  AuthUser? get currentUser;

  Future<AuthUser> signIn({
    required String email,
    required String password,
  });

  Future<void> logOut();

  Future<void> sendEmailVerification();

  Future<void> forgotPassword({
    required String email,
  });
}
