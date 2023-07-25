import 'package:flutter_bloc_example/domain/entities/login.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_auth_token_model.g.dart';

@JsonSerializable()
class LoginAuthTokenModel extends LoginAuthTokenEntities {
  const LoginAuthTokenModel({
    required super.authToken,
  });

  // instead of below line use above
  // const LoginAuthTokenModel({required String authToken}) : super(authToken: authToken);

  //Convert json to dart object
  factory LoginAuthTokenModel.fromJson(Map<String, dynamic> json) {
    return _$LoginAuthTokenModelFromJson(json);
    // return LoginAuthTokenModel(authToken: json['data']['token']);
  }

  // only show the dart object to convert to json
  Map<String, dynamic> toJson() {
    return _$LoginAuthTokenModelToJson(this);
  }
}
