import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_example/domain/respositories/number_trivia_repositories.dart';

import '../../core/error/failures.dart';
import '../../core/usecases/usecases.dart';
import '../entities/number_trivia.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    // return null;
    return await repository.getRandomNumberTrivia();
  }
}
