import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'injection_container.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/login/login_page.dart';
import 'presentation/pages/number_trivia_page.dart';
import 'presentation/pages/splash/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(MyApp());
}

class AppRouter {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'index',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/numberTrivia',
        name: 'numberTrivia',
        builder: (context, state) => const NumberTriviaPage(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
    ],
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  var appRoute = AppRouter().router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRoute,
      title: 'Number Trivia',
      theme: ThemeData(primaryColor: Colors.green.shade800, hintColor: Colors.green.shade600),
    );
  }
}

// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// const Color darkBlue = Color.fromARGB(255, 18, 32, 47);
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: darkBlue,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: const Scaffold(
//         body: Center(
//           child: MyWidget(),
//         ),
//       ),
//     );
//   }
// }
//
// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});
//
//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }
//
// class _MyWidgetState extends State<MyWidget> {
//   int stmt = 1;
//
//   @override
//   void initState() {
//     super.initState();
//     Timer.periodic(Duration(seconds: 1), (t) {
//       print("Yeah, this line is printed after 3 seconds");
//       setState(() {
//         stmt++;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(height: 100),
//         ElevatedButton(
//             onPressed: () {
//               Timer(const Duration(seconds: 3), () {
//                 print("Yeah, this line is printed after 3 seconds");
//                 setState(() {
//                   stmt++;
//                 });
//               });
//             },
//             child: Text("Click, $stmt")),
//         const Text('Click me'),
//       ],
//     );
//   }
// }
