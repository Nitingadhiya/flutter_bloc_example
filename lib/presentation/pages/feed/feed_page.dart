import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/core/extensions/translate_extension.dart';
import 'package:flutter_bloc_example/data/models/feed_model.dart';
import 'package:flutter_bloc_example/domain/entities/feed.dart';
import 'package:flutter_bloc_example/injection_container.dart';
import 'package:flutter_bloc_example/presentation/bloc/feed/feed_bloc.dart';
import 'package:flutter_bloc_example/presentation/bloc/language/localization_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../core/enums/language.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<FeedBloc>(),
      child: const FeedView(),
    );
  }
}

class FeedView extends StatelessWidget {
  const FeedView({super.key});

  Widget _buildButton(context, String title, Language language) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: Text(
          title,
        ),
        onPressed: () {
          BlocProvider.of<LanguageBloc>(context).add(language);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final PagingController<int, FeedEntities> pagingController = PagingController(firstPageKey: 0);

    pagingController.addPageRequestListener((pageKey) {
      context.read<FeedBloc>().add(FetchData(pageKey));
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: true,
        actions: <Widget>[
          _buildButton(context, 'TR', Language.TR),
          _buildButton(context, 'EN', Language.EN),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //
          Text("helloWorld".xTr(context)),
          Text(FlutterI18n.translate(context, "helloWorld", fallbackKey: "button.label.clickMe")),

          //
          Localizations.override(
            context: context,
            locale: Language.EN.xGetLocale,
            child: Builder(
              builder: (BuildContext context) {
                return Text(
                  context.xTr('helloWorld'),
                );
              },
            ),
          ),

          //
          Text(
            context.xTr(
              'greeting',
              parameters: {
                'hello': 'Hello',
                'world': 'Hello',
              },
            ),
          ),

          //
          Text(
            context.xTr(
              'numberOfDataPoints',
              parameters: {
                'value': 1200000.toString(),
              },
            ),
          ),

          //
          Text(
            context.xTr(
              'helloWorldOn',
              parameters: {
                'date': DateTime.utc(1997, 04, 01).toString(),
              },
            ),
          ),
        ],
      )

          /*
      BlocConsumer<FeedBloc, FeedState>(
        listener: (context, state) {
          if (State is PostFailedToLoad) {
            print("PostFailedToLoad");
          } else if (state is PostException) {
            pagingController.error = state.error;
          } else if (state is FeedLoaded) {
            if (state.pageKey == 0) {
              pagingController.itemList = [];
            }
            final isLastPage = state.tempData.length < 15;
            if (isLastPage) {
              pagingController.appendLastPage(state.tempData);
            } else {
              final nextPageKey = state.pageKey + state.tempData.length;
              pagingController.appendPage(state.tempData, nextPageKey);
            }
          }
        },
        builder: (context, state) {
          if (state is PostFailedToLoad) {
            return Text(state.message);
          }
          return RefreshIndicator(
            onRefresh: () async {
              context.read<FeedBloc>().add(FetchData(0));
            },
            child: PagedListView<int, FeedEntities>(
              pagingController: pagingController,
              builderDelegate: PagedChildBuilderDelegate<FeedEntities>(
                itemBuilder: (context, item, index) {
                  return SizedBox(height: 100, child: Text('${item.id} - ${item.description}'));
                },
              ),
            ),
          );
        },
      ),*/
          ),
    );
  }
}
