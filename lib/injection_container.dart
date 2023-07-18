import 'package:flutter_bloc_example/core/network/network_info.dart';
import 'package:flutter_bloc_example/core/util/input_converter.dart';
import 'package:flutter_bloc_example/data/data_sources/number_trivia_local_data_sources.dart';
import 'package:flutter_bloc_example/data/data_sources/number_trivia_remote_data_source.dart';
import 'package:flutter_bloc_example/data/repositories/number_trivia_repository_impl.dart';
import 'package:flutter_bloc_example/domain/respositories/number_trivia_repositories.dart';
import 'package:flutter_bloc_example/domain/usecases/get_concreteNumberTrivia.dart';
import 'package:flutter_bloc_example/domain/usecases/get_ramdomNumberTrivia.dart';
import 'package:flutter_bloc_example/presentation/bloc/number_trivia/number_trivia_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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

  locator.registerLazySingleton(() => GetConcreteNumberTrivia(locator()));
  locator.registerLazySingleton(() => GetRandomNumberTrivia(locator()));

  //Repositories
  locator.registerLazySingleton<NumberTriviaRepository>(
    () => NumberTriviaRepositoryImpl(
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

  // core
  locator.registerLazySingleton(() => InputConverter());
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));
}
