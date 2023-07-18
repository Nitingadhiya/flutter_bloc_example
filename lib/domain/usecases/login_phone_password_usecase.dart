import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/domain/entities/login.dart';
import '../../core/error/failures.dart';
import '../../core/usecases/usecases.dart';
import '../respositories/login_email_password_repositories.dart';

class LoginPhonePasswordUseCase implements UseCase<LoginAuthTokenEntities, Params> {
  // LoginEmailPasswordRepository => Getting from repositories folder
  //repository => it's just a declare variable
  final LoginEmailPasswordRepository repository;

  LoginPhonePasswordUseCase(this.repository);

// start implementation of execute method
  //here we call repository methods from LoginPhonePasswordUseCase file.
  @override
  Future<Either<Failure, LoginAuthTokenEntities>> call(Params params) async {
    return await repository.loginWithPhonePassword(params.phone, params.password);
    //Here we get the data from repository
  }

//If don't have to pass params then use "NoParams" class which declare in core directory
}

class Params extends Equatable {
  final int phone;
  final String password;

  const Params({required this.phone, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [phone, password];
}
