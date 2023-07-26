part of 'feed_bloc.dart';

@immutable
abstract class FeedState extends Equatable {}

class FeedInitial extends FeedState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class FeedLoaded extends FeedState {
  List<FeedEntities> tempData = [];
  int pageKey = 0;

  FeedLoaded(this.tempData, this.pageKey);

  @override
  // TODO: implement props
  List<Object?> get props => [tempData, pageKey];
}

class PostFailedToLoad extends FeedState {
  String message;

  PostFailedToLoad({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class PostException extends FeedState {
  Object? error;

  PostException({required this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
