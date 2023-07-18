import 'package:flutter_bloc_example/domain/entities/login.dart';

class LoginAuthTokenModel extends LoginAuthTokenEntities {
  const LoginAuthTokenModel({required String authToken}) : super(authToken: authToken);

  factory LoginAuthTokenModel.fromJson(Map<String, dynamic> json) {
    return LoginAuthTokenModel(authToken: json['authToken']);
  }
}
