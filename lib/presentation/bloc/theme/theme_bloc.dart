import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/enums/theme.dart';

part 'theme_event.dart';

part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    print("Theme initialization");
    // emit(ThemeChanges(AppThemeMode.dark));
    //
    // on<ChangeThemeEvent>((event, emit) {
    //   print("Change Theme Event:  + $event");
    //   // TODO: implement event handler
    //   emit(ThemeState(selectedTheme: ));
    // });

    on<ChangeThemeEvent>(changeThemeMethod);
  }

  changeThemeMethod(event, emit) async {
    emit(ThemeChanges(selectedTheme: event.selectedThemeMode));
  }
}
