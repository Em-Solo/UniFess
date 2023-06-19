import 'package:firebase_auth/firebase_auth.dart';

// a users class defined by me
class AuthUser {
  final String id;
  final String email;
  final bool isEmailVerified;

  AuthUser({
    required this.id,
    required this.email,
    required this.isEmailVerified,
  });

  // a factory constructor that gets the a user from firebase and creates an instance of the user class defined by me
  factory AuthUser.fromFirebase(User user) => AuthUser(
        id: user.uid,
        email: user.email!,
        isEmailVerified: user.emailVerified,
      );
}
