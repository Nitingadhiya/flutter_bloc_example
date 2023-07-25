part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeInitial extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeLoaded extends HomeState {
  List tempData = [];

  HomeLoaded(this.tempData);

  @override
  // TODO: implement props
  List<Object?> get props => [tempData];
}

class PostFailedToLoad extends HomeState {
  String message;

  PostFailedToLoad({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
