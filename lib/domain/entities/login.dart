import 'package:equatable/equatable.dart';

// completly independent

//check API json response and create a Entities

class LoginEntities extends Equatable {
  final String authToken;

  const LoginEntities({required this.authToken}) : super();

  @override
  // TODO: implement props
  List<Object?> get props => [authToken];
}
