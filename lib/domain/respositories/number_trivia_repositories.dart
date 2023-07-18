import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_example/core/error/failures.dart';
import 'package:flutter_bloc_example/domain/entities/number_trivia.dart';
import 'package:flutter_bloc_example/domain/usecases/get_concreteNumberTrivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);

  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
