import 'package:equatable/equatable.dart';
import 'package:unifess/models/services/authentication/auth_user.dart';

enum LoadingStatus {
  initial,
  loading,
  success,
  error,
}

class LoginPageState extends Equatable {
  final LoadingStatus status;
  final String? error;
  final AuthUser? user;

  const LoginPageState.initial()
      : status = LoadingStatus.initial,
        error = null,
        user = null;
  const LoginPageState.loading()
      : status = LoadingStatus.loading,
        error = null,
        user = null;

  const LoginPageState.success(this.user)
      : status = LoadingStatus.success,
        error = null;

  const LoginPageState.error(this.error)
      : status = LoadingStatus.error,
        user = null;

  @override
  List<Object?> get props => [status, error, user];
}

// class LoginState extends Equatable {
//   const LoginState();

//   @override
//   List<Object> get props => [];
// }

// class LoginStateInitial extends LoginState {
//   const LoginStateInitial();

//   @override
//   List<Object> get props => [];
// }

// class LoginStateLoading extends LoginState {
//   const LoginStateLoading();

//   @override
//   List<Object> get props => [];
// }

// class LoginStateSuccess extends LoginState {
//   const LoginStateSuccess();

//   @override
//   List<Object> get props => [];
// }

// class LoginStateError extends LoginState {
//   final String error;

//   const LoginStateError(this.error);

//   @override
//   List<Object> get props => [];
// }
