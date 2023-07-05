import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unifess/models/services/authentication/auth_service.dart';

import 'package:unifess/view_models/login_page_vm/login_page_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  final AuthService _authService;
  LoginPageCubit(this._authService) : super(const LoginPageState.initial());

  Future<void> logIn(String email, String password) async {
    // After pressing login we will perform some async function - we don't know how long the logging in will take
    // therefore on the page we want to show some loading indicator
    emit(const LoginPageState.loading());
    try {
      /// Make the call to the repository to sign the user in - this will talk to firebase and do the login
      final user = await _authService.signIn(email: email, password: password);

      // Given no errors were thrown - this would the case if it failed we can emit the success state with the user object
      emit(LoginPageState.success(user));
    } catch (e) {
      // Given there has been an error thrown we want to emit the error state with the error message
      emit(LoginPageState.error(e.toString()));
    }
  }
}
