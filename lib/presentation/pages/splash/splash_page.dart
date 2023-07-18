import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/data/data_sources/number_trivia_local_data_sources.dart';
import 'package:flutter_bloc_example/injection_container.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/services.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  // static const platform = MethodChannel('printer_flutter');

  //
  // Future<void> callAarMethod() async {
  //   try {
  //     var posConnect = await platform.invokeMethod('init');
  //     print('posConnect:-- $posConnect');
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash screen"),
      ),
      body: Column(
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
      ),
    );
  }
}
