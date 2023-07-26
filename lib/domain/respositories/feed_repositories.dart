//It's just contract
import 'package:dartz/dartz.dart';

import '../../core/error/failures.dart';
import '../entities/feed.dart';
import '../usecases/feed_usecase.dart';

abstract class FeedRepository {
  //Here we declare methods
  // pass parameters mention "email, password"
  //Failure => If get the error
//LoginEntities => success data (here in the loginEntities which is inside Domain >> entities >> login.dart)

  Future<Either<Failure, List<FeedEntities>>> getFeed(FeedParams params);
}
