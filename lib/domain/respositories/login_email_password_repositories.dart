import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_example/core/error/failures.dart';

import '../entities/login.dart';

abstract class LoginEmailPasswordRepository {
  //Here we declare methods
  // pass parameters mention "email, password"
  //Failure => If get the error
//LoginEntities => success data (here in the loginEntities which is inside Domain >> entities >> login.dart)

  Future<Either<Failure, LoginAuthTokenEntities>> loginWithEmailPassword(String email, String password);

  Future<Either<Failure, LoginAuthTokenEntities>> loginWithPhonePassword(int phone, String password);
}
