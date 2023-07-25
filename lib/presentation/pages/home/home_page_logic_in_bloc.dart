// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc_example/data/models/feed_model.dart';
// import 'package:flutter_bloc_example/domain/entities/home.dart';
// import 'package:flutter_bloc_example/injection_container.dart';
// import 'package:flutter_bloc_example/presentation/bloc/home/home_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => locator.get<HomeBloc>(),
//       child: const HomeView(),
//     );
//   }
// }
//
// class HomeView extends StatelessWidget {
//   const HomeView({super.key});
//
//   static const _pageSize = 20;
//
//   @override
//   Widget build(BuildContext context) {
//     var _pagingController = context.read<HomeBloc>().pagingController;
//
//     _pagingController.addPageRequestListener((pageKey) {
//       // _fetchPage(pageKey);
//       // FetchData();
//       context.read<HomeBloc>().add(FetchData(pageKey));
//       //TODO Dispatch event
//     });
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//         automaticallyImplyLeading: true,
//       ),
//       body: BlocConsumer<HomeBloc, HomeState>(
//         listener: (context, state) {
//           // TODO: implement listener
//
//           if (State is PostFailedToLoad) {
//             print("PostFailedToLoad");
//           }
//
//           if (state is HomeLoaded) {
//             print("STATE: ${state.tempData}");
//           }
//         },
//         builder: (context, state) {
//           if (state is PostFailedToLoad) {
//             return Text(state.message);
//           }
//           return RefreshIndicator(
//             onRefresh: () async {
//               context.read<HomeBloc>().add(FetchData(0));
//             },
//             child: PagedListView<int, FeedEntities>(
//               pagingController: _pagingController,
//               builderDelegate: PagedChildBuilderDelegate<FeedEntities>(
//                 itemBuilder: (context, item, index) {
//                   return SizedBox(height: 100, child: Text('${item.id}'));
//                 },
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
