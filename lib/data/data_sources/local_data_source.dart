import 'dart:convert';

import 'package:flutter_bloc_example/core/error/exceptions.dart';
import 'package:flutter_bloc_example/data/models/login_auth_token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// contract
abstract class LocalDataSource {
  ///Gets the cached AuthenticationToken which was gotten the last time
  /// the user had internet connection.

  /// Throws [CacheException] if no cached data is present.
  Future<LoginAuthTokenModel> getAuthenticationToken();

  String? getCacheToken();

  Future<void> cacheAuthenticationToken(LoginAuthTokenModel authenticationTokenCache);

  Future<void> cacheToken(String authenticationTokenCache);

  Future<void> removeAuthToken();
}

const CACHED_AUTH_TOKEN = 'CACHED_AUTH_TOKEN';
const CACHED_AUTH_TOKEN_STRING = 'CACHED_AUTH_TOKEN_STRING';

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheAuthenticationToken(LoginAuthTokenModel authenticationTokenCache) {
    // TODO: implement cacheAuthenticationToken
    return sharedPreferences.setString(
      CACHED_AUTH_TOKEN,
      jsonEncode(authenticationTokenCache.toJson()),
    );
  }

  @override
  Future<LoginAuthTokenModel> getAuthenticationToken() {
    // TODO: implement getAuthenticationToken
    // throw UnimplementedError();
    final jsonString = sharedPreferences.getString(CACHED_AUTH_TOKEN);
    if (jsonString != null) {
      return Future.value(LoginAuthTokenModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheToken(String authenticationTokenCache) {
    // TODO: implement cacheAuthenticationToken
    return sharedPreferences.setString(
      CACHED_AUTH_TOKEN_STRING,
      authenticationTokenCache,
    );
  }

  @override
  Future<void> removeAuthToken() async {
    sharedPreferences.remove(CACHED_AUTH_TOKEN_STRING);
    sharedPreferences.remove(CACHED_AUTH_TOKEN);
  }

  @override
  String? getCacheToken() {
    // TODO: implement getAuthenticationToken
    // throw UnimplementedError();
    final jsonString = sharedPreferences.getString(CACHED_AUTH_TOKEN_STRING);
    print("jsonString:-- $jsonString");
    if (jsonString != null) {
      return jsonString;
    } else {
      return null;
      // throw CacheException();
    }
  }
}
