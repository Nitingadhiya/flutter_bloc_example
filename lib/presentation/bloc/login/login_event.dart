part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginInitialEvent extends LoginEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginSubmittedEvent extends LoginEvent {
  final String? email;
  final String? password;
  final String? phone;

  const LoginSubmittedEvent({this.email, this.password, this.phone});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginFailedEvent extends LoginEvent {
  final String? emailValidation;
  final String? passwordValidation;

  const LoginFailedEvent({this.emailValidation, this.passwordValidation});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
