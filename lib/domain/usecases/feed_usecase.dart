import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/domain/entities/feed.dart';
import '../../core/error/failures.dart';
import '../../core/usecases/usecases.dart';
import '../respositories/feed_repositories.dart';

class FeedUseCase implements UseCase<List<FeedEntities>, FeedParams> {
  // FeedRepository => Getting from repositories folder
  //repository => it's just a declare variable
  final FeedRepository repository;

  FeedUseCase(this.repository);

// start implementation of execute method
  //here we call repository methods from FeedUseCase file.
  @override
  Future<Either<Failure, List<FeedEntities>>> call(params) async {
    return await repository.getFeed(params);
    //Here we get the data from repository
  }
}

class FeedParams extends Equatable {
  final int skip;
  final int take;

  const FeedParams({required this.skip, required this.take});

  @override
  // TODO: implement props
  List<Object?> get props => [skip, take];

  Map<String, dynamic> toJson() => {
        'skip': skip,
        'take': take,
      };
}
