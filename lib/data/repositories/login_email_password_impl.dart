import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_example/core/error/exceptions.dart';
import 'package:flutter_bloc_example/core/error/failures.dart';
import 'package:flutter_bloc_example/core/network/network_info.dart';
import 'package:flutter_bloc_example/data/data_sources/remote_data_source.dart';
import 'package:flutter_bloc_example/data/models/login_auth_token_model.dart';
import 'package:flutter_bloc_example/domain/entities/login.dart';
import 'package:flutter_bloc_example/domain/respositories/login_email_password_repositories.dart';

import '../data_sources/local_data_source.dart';

/// Caching policy we will describe here
///
typedef _LoginEmailOrPhone = Future<LoginAuthTokenModel> Function();

class LoginEmailPasswordRepositoryImpl implements LoginEmailPasswordRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  // Future<LoginAuthTokenModel> =  Function() getEPAuthTK;

  LoginEmailPasswordRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, LoginAuthTokenEntities>> loginWithEmailPassword(String email, String password) async {
    // TODO: implement loginWithEmailPassword
    return await _getEmailPhoneAuthToken(() => remoteDataSource.loginWithEmailPassword(email, password));
  }

  @override
  Future<Either<Failure, LoginAuthTokenEntities>> loginWithPhonePassword(int phone, String password) async {
    return await _getEmailPhoneAuthToken(() => remoteDataSource.loginWithPhonePassword(phone, password));
  }

  //here we can use "LoginAuthTokenEntities" instead of LoginAuthTokenModel

  Future<Either<Failure, LoginAuthTokenEntities>> _getEmailPhoneAuthToken(_LoginEmailOrPhone getEPAuthTK) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteLoginAuthentication = await getEPAuthTK();
        print("remoteLoginAuthentication:- $remoteLoginAuthentication");
        // localDataSource.cacheAuthenticationToken(remoteLoginAuthentication);
        localDataSource.cacheToken(remoteLoginAuthentication.authToken);
        return Right(remoteLoginAuthentication);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localLoginAuthentication = await localDataSource.getAuthenticationToken();
        return Right(localLoginAuthentication);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
