part of 'feed_bloc.dart';

@immutable
abstract class FeedEvent extends Equatable {}

class InitialHomeEvent extends FeedEvent {
  @override
  List<Object?> get props => [];
}

class FetchData extends FeedEvent {
  final int? pageKey;

  FetchData(this.pageKey);

  @override
  List<Object?> get props => [pageKey];
}
