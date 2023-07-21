part of 'login_bloc.dart';

// @immutable
// class LoginState extends Equatable {
//   final String? email;
//   final String? password;
//   final String? passwordValidation;
//
//   const LoginState({this.email, this.password, this.passwordValidation});
//
//   LoginState copyWith({
//     String? email,
//     String? password,
//     String? passwordValidation,
//   }) {
//     return LoginState(
//       email: email ?? this.email,
//       password: password ?? this.password,
//       passwordValidation: passwordValidation ?? this.passwordValidation,
//     );
//   }

//   @override
//   // TODO: implement props
//   List<Object?> get props => throw UnimplementedError();
// }

abstract class LoginState extends Equatable {
  // final String? email;
  // final String? password;
  //
  // const LoginState({this.email, this.password});
  const LoginState();
}

class LoginInitialState extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginLoading extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoginSuccess extends LoginState {
  final String? authToken;

  const LoginSuccess({this.authToken});

  @override
  // TODO: implement props
  List<Object?> get props => [authToken];
}

class LoginFailedState extends LoginState {
  final String? passwordValidation;
  final String? emailValidation;
  final String? message;

  const LoginFailedState({this.passwordValidation, this.emailValidation, this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//
// class LoginSubmitted extends LoginState {
//   final String? email;
//   final String? password;
//   final String? phone;
//   final String? passwordValidation;
//   final String? emailValidation;
//
//   const LoginSubmitted({this.email, this.password, this.passwordValidation, this.phone, this.emailValidation});
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [email, password, emailValidation, passwordValidation];
//
// // LoginState copyWith({
// //   String? email,
// //   String? password,
// //   String? passwordValidation,
// // }) {
// //   return LoginSubmitted(
// //     email: email ?? this.email,
// //     password: password ?? this.password,
// //     passwordValidation: passwordValidation ?? this.passwordValidation,
// //   );
// }

// class Error extends LoginState {
//   final String? message;
//
//   const Error({this.message});
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [message];
// }

//
// class LoginInitial extends LoginState {}
//
// class LoginLoadState extends LoginState {
//   final String? email;
//   final String? password;
//
//   LoginLoadState({this.email, this.password});
// }
