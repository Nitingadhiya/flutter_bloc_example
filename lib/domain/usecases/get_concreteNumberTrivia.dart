import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/core/usecases/usecases.dart';
import 'package:flutter_bloc_example/domain/respositories/number_trivia_repositories.dart';

import '../../core/error/failures.dart';
import '../entities/number_trivia.dart';

//NumberTrivia => Entity

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }
}

class Params extends Equatable {
  final int number;

  const Params({required this.number}) : super();

  @override
  // TODO: implement props
  List<Object?> get props => [number];
}
