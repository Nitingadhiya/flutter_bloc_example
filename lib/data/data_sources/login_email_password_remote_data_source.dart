import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc_example/data/models/login_auth_token_model.dart';
import 'package:http/http.dart' as http;

import '../../core/error/exceptions.dart';

abstract class LoginEmailPasswordRemoteDataSource {
  ///calls the API
  ///
  /// Throws a [ServerException] for all error codes.

  Future<LoginAuthTokenModel> loginWithEmailPassword(String email, String password);

  ///calls the API
  ///
  /// Throws a [ServerException] if

  Future<LoginAuthTokenModel> loginWithPhonePassword(int phone, String password);
}

class LoginEmailPasswordRemoteDataSourceImpl implements LoginEmailPasswordRemoteDataSource {
  final http.Client client;

  LoginEmailPasswordRemoteDataSourceImpl({required this.client});

  @override
  Future<LoginAuthTokenModel> loginWithEmailPassword(String email, String password) async {
    // TODO: implement loginWithEmailPassword
    print("loginWithEmailPassword");
    String url = 'https://develop.carerockets.com/api/v4/login/';
    var data = {'username': email, 'password': password};
    return _getTokenFromUrl(url, data);
  }

  @override
  Future<LoginAuthTokenModel> loginWithPhonePassword(int phone, String password) {
    // TODO: implement loginWithPhonePassword
    String url = 'https://develop.carerockets.com/api/v4/login/';
    var data = {'phone': phone, 'password': password};
    return _getTokenFromUrl(url, data);
  }

  Future<LoginAuthTokenModel> _getTokenFromUrl(String url, data) async {
    final response = await client.post(Uri.parse(url), body: json.encode(data), headers: {
      'Content-Type': 'application/json',
      "Accept": "application/json",
    });
    print("response:-- ${response.statusCode}");
    // if(x.)
    // TODO: implement getConcreteNumberTrivia
    if (response.statusCode == 200) {
      log("response.body:-- ${response.body}");
      return LoginAuthTokenModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
