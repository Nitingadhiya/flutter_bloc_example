import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_example/core/error/exceptions.dart';
import 'package:flutter_bloc_example/data/data_sources/number_trivia_local_data_sources.dart';
import 'package:flutter_bloc_example/data/data_sources/number_trivia_remote_data_source.dart';

import '../../core/error/failures.dart';
import '../../core/network/network_info.dart';
import '../../domain/entities/number_trivia.dart';
import '../../domain/respositories/number_trivia_repositories.dart';

typedef Future<NumberTrivia> _concreateOrRandomChooser();

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl({required this.remoteDataSource, required this.localDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number) async {
    return await _getTrivia(() => remoteDataSource.getConcreteNumberTrivia(number));

    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await remoteDataSource.getConcreteNumberTrivia(number);
        return Right(remoteTrivia);
      } on ServerException catch (e) {
        print(e);
        // TODO
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTrivia = await localDataSource.getLastNumberTrivia();
        return Right(localTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async {
    return await _getTrivia(() {
      return remoteDataSource.getRandomNumberTrivia();
    });
  }

  //Future<NumberTrivia> Function()  " => refactor this to that  => "  // _concreateOrRandomChooser

  Future<Either<Failure, NumberTrivia>> _getTrivia(_concreateOrRandomChooser getConcreteOrRandom) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await getConcreteOrRandom();
        return Right(remoteTrivia);
      } on ServerException catch (e) {
        print(e);
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTrivia = await localDataSource.getLastNumberTrivia();
        return Right(localTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
