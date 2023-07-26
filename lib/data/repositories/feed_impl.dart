import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_example/core/error/exceptions.dart';
import 'package:flutter_bloc_example/core/error/failures.dart';
import 'package:flutter_bloc_example/core/network/network_info.dart';
import 'package:flutter_bloc_example/data/data_sources/remote_data_source.dart';
import 'package:flutter_bloc_example/data/models/login_auth_token_model.dart';
import 'package:flutter_bloc_example/domain/entities/feed.dart';
import 'package:flutter_bloc_example/domain/entities/login.dart';
import 'package:flutter_bloc_example/domain/usecases/get_concreteNumberTrivia.dart';

import '../../domain/respositories/feed_repositories.dart';
import '../../domain/usecases/feed_usecase.dart';
import '../data_sources/local_data_source.dart';

/// Caching policy we will describe here
///
typedef _LoginEmailOrPhone = Future<LoginAuthTokenModel> Function();

class FeedRepositoryImpl implements FeedRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  // Future<LoginAuthTokenModel> =  Function() getEPAuthTK;

  FeedRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<FeedEntities>>> getFeed(params) async {
    // TODO: implement loginWithEmailPassword
    if (await networkInfo.isConnected) {
      try {
        final feedData = await remoteDataSource.getFeedDataFromApi(params);
        return Right(feedData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        // final localLoginAuthentication = await localDataSource.getAuthenticationToken();
        return Left(CacheFailure());
        // return Right(localLoginAuthentication);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
