import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/core/error/failures.dart';

import '../../../core/util/input_converter.dart';
import '../../../domain/usecases/login_email_password_usecase.dart';
import '../../../domain/usecases/login_phone_password_usecase.dart';

part 'login_event.dart';

part 'login_state.dart';

const SERVER_FAILURE_MESSAGE = 'SERVER_FAILURE_MESSAGE';
const CACHE_FAILURE_MESSAGE = 'CACHE_FAILURE_MESSAGE';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  TextEditingController txtEmailController = TextEditingController();
  TextEditingController txtPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final LoginEmailPasswordUseCase loginEmailPasswordUseCase;
  final LoginPhonePasswordUseCase loginPhonePasswordUseCase;
  final InputConverter? inputConverter;

  LoginBloc({required this.loginEmailPasswordUseCase, required this.loginPhonePasswordUseCase, this.inputConverter}) : super(LoginInitialState()) {
    // on<EmailEvent>(_emailEvent);
    // on<PasswordEvent>(_passwordEvent);
    on<LoginSubmittedEvent>(_loginSubmittedEvent);
  }

//
// LoginBloc() : super(LoginState()) {
//   on<EmailEvent>(_emailEvent);
//   on<PasswordEvent>(_passwordEvent);
//   on<LoginSubmitted>(_loginSubmitted);
// }
//
//   void _emailEvent(EmailEvent event, Emitter<LoginState> emit) {
//     print("my email ${event.email}");
//     emit(Loaded(email: event.email));
//     // emit(state.props.email);
//
//     // emit(LoginState(email: event.email));
//     // emit(state.copyWith(email: event.email));
//   }
//
//   void _passwordEvent(PasswordEvent event, Emitter<LoginState> emit) {
//     // emit(state.copyWith(password: event.password));
//     emit(Loaded(password: event.password));
//   }
//
  void _loginSubmittedEvent(event, emit) async {
    // print("event:-- $event");
    // if (event is EmailEvent) {
    //   print(event.email);
    //   // event.email
    // }
    // print("email:- ${event.email}");
    // print(event.props.email);
    print(event.password);
    print(event.email);
    if (formKey.currentState!.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
    // emit(LoginFailedState(passwordValidation: 'Please enter password', emailValidation: 'adss'));
    // emit(state.copyWith(passwordValidation: 'event.password'));
    // formKey.currentState!.save();
    final authTokenOrFailure = await loginEmailPasswordUseCase(LoginParams(email: 'nitin_dummy@pinetco.com', password: 'PinetcoRocket'));
    print("authTokenOrFailure:-- $authTokenOrFailure");
    authTokenOrFailure.fold(
      (failure) {
        print("fail");
        emit(LoginFailedState(message: _mapFailureToMessage(failure)));
      },
      (right) {
        print("right11:- ${right.authToken}");
        emit(LoginSuccess(authToken: right.authToken));
      },
    );
    // print("state.email, ${state.email} ${state.password}");

    // state.email
  }
// LoginBloc(): super((){
//
// });
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case CacheFailure:
      return CACHE_FAILURE_MESSAGE;
    default:
      return 'Unexpected error';
  }
}
