import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/data/data_sources/local_data_source.dart';
import 'package:flutter_bloc_example/data/models/login_auth_token_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../injection_container.dart';

class ApiRequest {
  final _baseUrl = 'https://develop.carerockets.com/api/';
  final Dio dio = Dio(
    BaseOptions(
      headers: {'accept': 'application/json'},
      connectTimeout: const Duration(seconds: 35),
      receiveTimeout: const Duration(seconds: 35),
      validateStatus: (statusCode) => true,
    ),
  )..interceptors.addAll([
      PrettyDioLogger(),
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
          print("Request");
          // Do something before request is sent.
          // If you want to resolve the request with custom data,
          // you can resolve a `Response` using `handler.resolve(response)`.
          // If you want to reject the request with a error message,
          // you can reject with a `DioException` using `handler.reject(dioError)`.
          // print("locator<LocalDataSource>().getAuthenticationToken():222-- ${locator<LocalDataSource>().getAuthenticationToken()}");

          String? authToken = await locator<LocalDataSource>().getCacheToken();
          print("authToken:- ${authToken}");
          options.headers.addAll({"Authorization": "Bearer $authToken"});
          // options.headers.add("Authorization": "Bearer $authToken");
          print(options.headers);
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          // print("RRRRR");
          // Do something with response data.
          // If you want to reject the request with a error message,
          // you can reject a `DioException` object using `handler.reject(dioError)`.

          if (response.statusCode == 401) {
            locator<LocalDataSource>().removeAuthToken();
          }

          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) {
          print("DioException");

          // Do something with response error.
          // If you want to resolve the request with some custom data,
          // you can resolve a `Response` object using `handler.resolve(response)`.
          return handler.next(e);
        },
      ),
    ]);

  // Dio addInterceptors(Dio dio) {
  //   return dio
  //     ..interceptors.add(InterceptorsWrapper(
  //       onRequest: (RequestOptions options) => requestInterceptor(options),
  //     ));
  // }

  // dynamic requestInterceptor(RequestOptions options) async {
  //   // SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // var token = prefs.get("token");
  //   // var prefs = await locator();
  //   // var token = prefs.get("token");
  //   // print(LocalDataSource().getAuthenticationToken());
  //   // print(getAuthenticationToken());
  //   print(locator<LocalDataSource>().getAuthenticationToken());
  //
  //   options.headers.addAll({"Token": "toek"});
  //
  //   return options;
  // }

  //
  // dio.interceptors.add(InterceptorsWrapper(
  // onRequest: (RequestOptions options) => requestInterceptor(options),
  // onResponse: (Response response) => responseInterceptor(response),
  // onError: (DioError dioError) => errorInterceptor(dioError)));

  Future networkRequest(url, data, [type]) async {
    print("url:-- $url");

    var postResponse;
    switch (type) {
      case "post":
        postResponse = await dio.post(_baseUrl + url, data: data);
        break;
      case "get":
        postResponse = await dio.get(_baseUrl + url, queryParameters: data);
        break;
      default:
        postResponse = await dio.get(_baseUrl + url);
        break;
    }

    // final postResponse = await dio.post(
    //   _baseUrl + url,
    //   data: data,
    // );
    print("network, ${postResponse.statusCode}");
    if (postResponse.statusCode == 200 || postResponse.statusCode == 201) {
      return onSuccessResponse(postResponse);
    } else if (postResponse.statusCode == 422) {
      return onValidation(postResponse);
    } else {
      return onError(postResponse);
    }
  }

  Future<dynamic> onSuccessResponse(Response postResponse) async {
    return ApiResponseClass(
      isSuccess: true,
      isError: false,
      validation: false,
      data: postResponse.data,
      message: postResponse.statusMessage,
      statusCode: postResponse.statusCode,
    );
  }

  Future<dynamic> onError(Response postResponse) async {
    return ApiResponseClass(
      isSuccess: false,
      isError: true,
      validation: false,
      data: postResponse.data,
      message: postResponse.statusMessage,
      statusCode: postResponse.statusCode,
    );
  }

  Future<dynamic> onValidation(Response postResponse) async {
    return ApiResponseClass(
      isSuccess: false,
      isError: false,
      validation: true,
      data: postResponse.data,
      message: postResponse.statusMessage,
      statusCode: postResponse.statusCode,
    );
  }
}

class ApiResponseClass {
  bool isSuccess;
  bool isError;
  dynamic data;
  String? message;
  bool? validation;
  int? statusCode;

  ApiResponseClass({required this.isSuccess, required this.isError, this.data, this.message, this.validation, this.statusCode});

  factory ApiResponseClass.fromJson(Map<String, dynamic> json) {
    return ApiResponseClass(
      message: json['message'] as String?,
      isSuccess: json['isSuccess'] as bool,
      isError: json['isSuccess'] as bool,
      data: json['data'] as String?,
      validation: json['validation'] as bool?,
      statusCode: json['status'] as int,
    );
  }
}
