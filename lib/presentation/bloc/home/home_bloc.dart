import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/data/models/feed_model.dart';
import 'package:flutter_bloc_example/domain/entities/home.dart';
import 'package:flutter_bloc_example/domain/usecases/feed_usecase.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FeedUseCase feedUseCase;

  HomeBloc({required this.feedUseCase}) : super(HomeInitial()) {
    // on<HomeEvent>((event, emit) {});
    on<FetchData>((event, emit) async {
      try {
        final newItems = await feedUseCase(
          FeedParams(
            skip: (event.pageKey as num).toInt(),
            take: 15,
          ),
        );
        newItems.fold(
          (failure) {
            emit(PostFailedToLoad(message: 'Failed to load'));
          },
          (right) {
            emit(HomeLoaded(right, (event.pageKey as num).toInt()));
          },
        );
      } catch (error) {
        emit(PostException(error: error));
      }
    });
  }
}
