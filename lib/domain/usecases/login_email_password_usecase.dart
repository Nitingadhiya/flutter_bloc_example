import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/domain/entities/login.dart';
import '../../core/error/failures.dart';
import '../../core/usecases/usecases.dart';
import '../respositories/login_email_password_repositories.dart';

class LoginEmailPasswordUseCase implements UseCase<LoginAuthTokenEntities, LoginParams> {
  // LoginEmailPasswordRepository => Getting from repositories folder
  //repository => it's just a declare variable
  final LoginEmailPasswordRepository repository;

  LoginEmailPasswordUseCase(this.repository);

// start implementation of execute method
  //here we call repository methods from LoginEmailPasswordUseCase file.
  @override
  Future<Either<Failure, LoginAuthTokenEntities>> call(LoginParams params) async {
    return await repository.loginWithEmailPassword(params.email, params.password);
    //Here we get the data from repository
  }
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
