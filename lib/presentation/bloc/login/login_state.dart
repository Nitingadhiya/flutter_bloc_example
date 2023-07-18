part of 'login_bloc.dart';

// @immutable
class LoginState {
  final String? email;
  final String? password;
  final String? passwordValidation;

  LoginState({this.email, this.password, this.passwordValidation});

  LoginState copyWith({
    String? email,
    String? password,
    String? passwordValidation,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      passwordValidation: passwordValidation ?? this.passwordValidation,
    );
  }
}
//
// class LoginInitial extends LoginState {}
//
// class LoginLoadState extends LoginState {
//   final String? email;
//   final String? password;
//
//   LoginLoadState({this.email, this.password});
// }
