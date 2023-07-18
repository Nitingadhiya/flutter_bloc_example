import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  TextEditingController txtEmailController = TextEditingController();
  TextEditingController txtPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginBloc() : super(LoginState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<LoginSubmitted>(_loginSubmitted);
  }

  void _emailEvent(EmailEvent event, Emitter<LoginState> emit) {
    print("my email ${event.email}");
    // emit(LoginState(email: event.email));
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _loginSubmitted(event, emit) {
    if (formKey.currentState!.validate()) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
    emit(state.copyWith(passwordValidation: 'event.password'));
    formKey.currentState!.save();
    print("state.email, ${state.email} ${state.password}");

    // state.email
  }
}
