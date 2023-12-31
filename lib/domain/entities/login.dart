import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// completly independent

//check API json response and create a Entities base on api response.

class LoginAuthTokenEntities extends Equatable {
  @JsonKey(name: "token")
  final String authToken;

  const LoginAuthTokenEntities({required this.authToken}) : super();

  @override
  // TODO: implement props
  List<Object?> get props => [authToken];
}
