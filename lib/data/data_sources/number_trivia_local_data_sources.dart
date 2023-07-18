// import 'package:flutter_bloc_example/injection_container.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// abstract class LocalDataSource {
//   Future<bool> isLogin();
// }
//
// class LocalDataSourceImpl implements LocalDataSource {
//   final SharedPreferences sharedPreferences;
//
//   LocalDataSourceImpl({required this.sharedPreferences});
//
//   @override
//   Future<bool> isLogin() async {
//     sharedPreferences.setInt('counter', 10);
//     // locator().pref.r
//     // Save an integer value to 'counter' key.
//     // await prefs.setInt('counter', 10);
//     //
//     // // Try reading data from the 'counter' key. If it doesn't exist, returns null.
//     final int? counter = await sharedPreferences.getInt('counter');
//     print("counter, $counter");
//     return true;
//   }
// }
import 'dart:convert';

import 'package:flutter_bloc_example/data/models/number_trivia_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/error/exceptions.dart';

abstract class NumberTriviaLocalDataSource {
  Future<NumberTriviaModel> getLastNumberTrivia();

  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}

const CACHED_NUMBER_TRIVIA = 'CACHED_NUMBER_TRIVIA';

class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource {
  final SharedPreferences sharedPreferences;

  NumberTriviaLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache) {
    return sharedPreferences.setString(CACHED_NUMBER_TRIVIA, jsonEncode(triviaToCache.toJson()));
    // TODO: implement cacheNumberTrivia
    // throw UnimplementedError();
  }

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
    final jsonString = sharedPreferences.getString(CACHED_NUMBER_TRIVIA);
    if (jsonString != null) {
      return Future.value(NumberTriviaModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }

    // TODO: implement getLastNumberTrivia
  }
}
