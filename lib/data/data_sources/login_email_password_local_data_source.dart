import 'dart:convert';

import 'package:flutter_bloc_example/core/error/exceptions.dart';
import 'package:flutter_bloc_example/data/models/login_auth_token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// contract
abstract class LoginEmailPasswordLocalDataSource {
  ///Gets the cached AuthenticationToken which was gotten the last time
  /// the user had internet connection.

  /// Throws [CacheException] if no cached data is present.
  Future<LoginAuthTokenModel> getAuthenticationToken();

  Future<void> cacheAuthenticationToken(LoginAuthTokenModel authenticationTokenCache);
}

const CACHED_AUTH_TOKEN = 'CACHED_AUTH_TOKEN';

class LoginEmailPasswordLocalDataSourceImpl implements LoginEmailPasswordLocalDataSource {
  final SharedPreferences sharedPreferences;

  LoginEmailPasswordLocalDataSourceImpl({required this.sharedPreferences});

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
      return Future.value(LoginAuthTokenModel.fromJson(jsonDecode(jsonString!)));
    } else {
      throw CacheException();
    }
  }
}
