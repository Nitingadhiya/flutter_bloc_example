import 'package:flutter_bloc_example/core/network/network_info.dart';
import 'package:flutter_bloc_example/core/util/input_converter.dart';
import 'package:flutter_bloc_example/data/data_sources/login_email_password_remote_data_source.dart';
import 'package:flutter_bloc_example/data/data_sources/number_trivia_local_data_sources.dart';
import 'package:flutter_bloc_example/data/data_sources/number_trivia_remote_data_source.dart';
import 'package:flutter_bloc_example/data/repositories/login_email_password_impl.dart';
import 'package:flutter_bloc_example/data/repositories/number_trivia_repository_impl.dart';
import 'package:flutter_bloc_example/domain/respositories/login_email_password_repositories.dart';
import 'package:flutter_bloc_example/domain/respositories/number_trivia_repositories.dart';
import 'package:flutter_bloc_example/domain/usecases/get_concreteNumberTrivia.dart';
import 'package:flutter_bloc_example/domain/usecases/get_ramdomNumberTrivia.dart';
import 'package:flutter_bloc_example/domain/usecases/login_email_password_usecase.dart';
import 'package:flutter_bloc_example/domain/usecases/login_phone_password_usecase.dart';
import 'package:flutter_bloc_example/presentation/bloc/login/login_bloc.dart';
import 'package:flutter_bloc_example/presentation/bloc/number_trivia/number_trivia_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'data/data_sources/login_email_password_local_data_source.dart';

final GetIt locator = GetIt.instance;
//
Future<void> setup() async {
  //local data sources
  // locator.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(sharedPreferences: locator()));

  //External
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => prefs);
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => InternetConnectionChecker());

  //Features
  locator.registerFactory(
    () => NumberTriviaBloc(
      getConcreteNumberTrivia: locator(),
      inputConverter: locator(),
      getRandomNumberTrivia: locator(),
    ),
  );
  locator.registerFactory(() => LoginBloc(loginEmailPasswordUseCase: locator(), loginPhonePasswordUseCase: locator()));

  //Use case
  locator.registerLazySingleton(() => GetConcreteNumberTrivia(locator()));
  locator.registerLazySingleton(() => GetRandomNumberTrivia(locator()));

  locator.registerLazySingleton(() => LoginEmailPasswordUseCase(locator()));
  locator.registerLazySingleton(() => LoginPhonePasswordUseCase(locator()));

  //Repositories
  locator.registerLazySingleton<NumberTriviaRepository>(
    () => NumberTriviaRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
      networkInfo: locator(),
    ),
  );

  locator.registerLazySingleton<LoginEmailPasswordRepository>(
    () => LoginEmailPasswordRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
      networkInfo: locator(),
    ),
  );

  // Data Sources
  locator.registerLazySingleton<NumberTriviaRemoteDataSource>(
    () => NumberTriviaRemoteDataSourceImpl(
      client: locator(),
    ),
  );
  locator.registerLazySingleton<NumberTriviaLocalDataSource>(
    () => NumberTriviaLocalDataSourceImpl(
      sharedPreferences: locator(),
    ),
  );

  locator.registerLazySingleton<LoginEmailPasswordRemoteDataSource>(
    () => LoginEmailPasswordRemoteDataSourceImpl(
      client: locator(),
    ),
  );
  locator.registerLazySingleton<LoginEmailPasswordLocalDataSource>(
    () => LoginEmailPasswordLocalDataSourceImpl(
      sharedPreferences: locator(),
    ),
  );

  // core
  locator.registerLazySingleton(() => InputConverter());
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));
}
