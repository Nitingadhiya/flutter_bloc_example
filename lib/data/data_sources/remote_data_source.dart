import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc_example/core/network/api.dart';
import 'package:flutter_bloc_example/data/models/feed_model.dart';
import 'package:flutter_bloc_example/data/models/login_auth_token_model.dart';
import 'package:flutter_bloc_example/domain/entities/home.dart';
import 'package:flutter_bloc_example/domain/usecases/get_concreteNumberTrivia.dart';

import '../../core/error/exceptions.dart';
import '../../domain/usecases/feed_usecase.dart';

abstract class RemoteDataSource {
  ///calls the API
  ///
  /// Throws a [ServerException] for all error codes.

  Future<LoginAuthTokenModel> loginWithEmailPassword(String email, String password);

  Future<LoginAuthTokenModel> loginWithPhonePassword(int phone, String password);

  Future<List<FeedModel>> getFeedDataFromApi(FeedParams params);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiRequest apiRequest;

  RemoteDataSourceImpl({required this.apiRequest});

  @override
  Future<LoginAuthTokenModel> loginWithEmailPassword(String email, String password) async {
    // TODO: implement loginWithEmailPassword
    String url = 'v4/login';
    var data = {'username': email, 'password': password};
    return _getTokenFromUrl(url, data);
  }

  @override
  Future<LoginAuthTokenModel> loginWithPhonePassword(int phone, String password) {
    // TODO: implement loginWithPhonePassword
    String url = 'v4/login/';
    var data = {'phone': phone, 'password': password};
    return _getTokenFromUrl(url, data);
  }

  Future<LoginAuthTokenModel> _getTokenFromUrl(String url, data) async {
    // final response = await dio.post(url, data: data, options: Options(headers: headers));
    var type = 'post';
    final response = await apiRequest.networkRequest(url, data, type);
    print("response:-- $response");
    if (response.statusCode == 200) {
      log("response.body:-- ${response.data}");
      return LoginAuthTokenModel.fromJson(response.data['data']);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<FeedModel>> getFeedDataFromApi(params) async {
    String url = 'v4/posts';
    var type = 'get';
    // Here we convert class to json object for pass data in the request
    final response = await apiRequest.networkRequest(url, params.toJson(), type);
    if (response.statusCode == 200) {
      try {
        final postList = List<FeedModel>.from(response.data['data'].map((json) => FeedModel.fromJson(json)));
        return postList;
      } catch (e) {
        throw ServerException();
      }
    } else {
      throw ServerException();
    }
  }
}
