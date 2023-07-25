import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/presentation/bloc/splash/splash_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../data/data_sources/local_data_source.dart';
import '../../../injection_container.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(SplashInitialEvent()),
      child: const SplashView(),
    );
  }
}

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash screen"),
      ),
      body: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is SplashLoginSuccessState) {
            context.goNamed('home');
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              const Text('Splash screen'),
              ElevatedButton(
                onPressed: () {
                  // callAarMethod();
                  // locator.get<LocalDataSource>().isLogin();
                  context.go('/login');
                  // context.goNamed('home');
                  // context.goNamed('numberTrivia');
                },
                child: Text('Login Screen'),
              ),
            ],
          );
        },
      ),
    );
  }
}
