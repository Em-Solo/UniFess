import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unifess/repositiories/auth/firebase_auth_service.dart';
import 'package:unifess/view_models/login_view_model/login_state.dart';

class LoginController extends StateNotifier<LoginState> {
  final Ref ref;

  LoginController(this.ref) : super(const LoginStateInitial());

  void login(String email, String password) async {
    state = const LoginStateLoading();

    try {
      await ref
          .read(firebaseAuthProvider)
          .signIn(email: email, password: password);
      state = const LoginStateSuccess();
    } catch (e) {
      state = LoginStateError(e.toString());
    }
  }
}

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController(ref);
});
