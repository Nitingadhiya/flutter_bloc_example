import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/data/models/feed_model.dart';
import 'package:flutter_bloc_example/domain/entities/feed.dart';
import 'package:flutter_bloc_example/domain/usecases/feed_usecase.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PagingController<int, FeedEntities> pagingController = PagingController(firstPageKey: 0);

  final FeedUseCase feedUseCase;

  HomeBloc({required this.feedUseCase}) : super(HomeInitial()) {
    // on<HomeEvent>((event, emit) {});
    on<FetchData>((event, emit) async {
      try {
        final newItems = await feedUseCase(FeedParams(skip: (event.pageKey as num).toInt(), take: 15));
        newItems.fold(
          (failure) {
            emit(PostFailedToLoad(message: 'Failed to load'));
          },
          (right) {
            if (event.pageKey! == 0) {
              pagingController.itemList = [];
            }

            final isLastPage = right.length < 15;
            if (isLastPage) {
              pagingController.appendLastPage(right);
            } else {
              final nextPageKey = event.pageKey! + right.length;
              pagingController.appendPage(right, nextPageKey);
            }
            emit(HomeLoaded(right));
          },
        );

        // final isLastPage = newItems.length < 20;
        // if (isLastPage) {
        //   pagingController.appendLastPage(newItems as List);
        // } else {
        //   final nextPageKey = event.key! + newItems.length;
        //   pagingController.appendPage(newItems as List, nextPageKey as int?);
        // }
        // emit(HomeLoaded(newItems as List));
      } catch (error) {
        pagingController.error = error;
      }
    });
  }
}
