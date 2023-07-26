import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enums/language.dart';

class LanguageBloc extends Bloc<Language, Locale> {
  LanguageBloc() : super(Language.TR.xGetLocale) {
    on<Language>((event, emit) {
      emit(event.xGetLocale);
    });
  }
}
