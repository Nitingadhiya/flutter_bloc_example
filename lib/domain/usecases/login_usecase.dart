import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_example/domain/entities/login.dart';

import '../../core/error/failures.dart';

class LoginUseCase {
  final LoginUseCase repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, LoginEntities>> call() async {
    return await repository.login();
  }
}
