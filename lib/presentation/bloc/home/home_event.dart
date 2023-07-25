part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {}

class InitialHomeEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class FetchData extends HomeEvent {
  final int? pageKey;

  FetchData(this.pageKey);

  @override
  List<Object?> get props => [pageKey];
}
