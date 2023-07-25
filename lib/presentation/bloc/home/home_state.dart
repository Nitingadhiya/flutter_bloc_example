part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeInitial extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeLoaded extends HomeState {
  List<FeedEntities> tempData = [];
  int pageKey = 0;

  HomeLoaded(this.tempData, this.pageKey);

  @override
  // TODO: implement props
  List<Object?> get props => [tempData, pageKey];
}

class PostFailedToLoad extends HomeState {
  String message;

  PostFailedToLoad({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class PostException extends HomeState {
  Object? error;

  PostException({required this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
