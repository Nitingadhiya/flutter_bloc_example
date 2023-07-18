import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/core/error/failures.dart';
import 'package:flutter_bloc_example/core/usecases/usecases.dart';
import 'package:flutter_bloc_example/domain/entities/number_trivia.dart';
import 'package:meta/meta.dart';

import '../../../core/util/input_converter.dart';
import '../../../domain/usecases/get_concreteNumberTrivia.dart';
import '../../../domain/usecases/get_ramdomNumberTrivia.dart';

part 'number_trivia_event.dart';

part 'number_trivia_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure ';
const String INVALID_INPUT_FAILURE_MESSAGE = 'Invalid Input - The number must be a positive integer ';
const String CACHE_FAILURE_MESSAGE = 'Server Failure ';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;

  // NumberTriviaBloc(
  //   super.initialState, {
  //   required this.getConcreteNumberTrivia,
  //   required this.getRandomNumberTrivia,
  //   required this.inputConverter,
  // });

  NumberTriviaBloc({
    required this.getConcreteNumberTrivia,
    required this.getRandomNumberTrivia,
    required this.inputConverter,
  }) : super(Empty()) {
    on<NumberTriviaEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is GetTriviaForConcreteNumber) {
        final inputEither = inputConverter.stringToUnsignedInteger(event.numberString);
        await inputEither.fold((failure) async {
          emit(Error(message: INVALID_INPUT_FAILURE_MESSAGE));
        }, (integer) async {
          emit(Loading());
          final failureOrTrivia = await getConcreteNumberTrivia(Params(number: integer));
          failureOrTrivia.fold((failure) async {
            return emit(Error(message: _mapFailureToMessage(failure)));
          }, (trivia) async {
            return emit(Loaded(trivia: trivia));
          });
        });
      } else if (event is GetTriviaForRandomNumber) {
        emit(Loading());
        final failureOrTrivia = await getRandomNumberTrivia(NoParams());
        await failureOrTrivia.fold((failure) async {
          return emit(Error(message: _mapFailureToMessage(failure)));
        }, (trivia) async {
          return emit(Loaded(trivia: trivia));
        });
      }
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unecpected error';
    }
  }
}
