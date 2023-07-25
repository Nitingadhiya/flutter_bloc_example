import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/data/data_sources/local_data_source.dart';

import '../../../injection_container.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashInitialEvent>((event, emit) async {
      print("Splash");

      await Future.delayed(Duration(seconds: 1));

      print("locator.get<LocalDataSource>().getCacheToken():-- ${locator.get<LocalDataSource>().getCacheToken()}");
      String? token = locator.get<LocalDataSource>().getCacheToken();
      if (token != null) {
        emit(SplashLoginSuccessState(true));
      }

      // TODO: implement event handler
    });
  }
}
