import 'package:flutter_bloc_example/domain/entities/login.dart';

class LoginAuthTokenModel extends LoginAuthTokenEntities {
  const LoginAuthTokenModel({required String authToken}) : super(authToken: authToken);

  //Convert json to dart object
  factory LoginAuthTokenModel.fromJson(Map<String, dynamic> json) {
    return LoginAuthTokenModel(authToken: json['data']['token']);
  }

  // only show the dart object to convert to json
  Map<String, dynamic> toJson() {
    return {'authToken': authToken};
  }
}
