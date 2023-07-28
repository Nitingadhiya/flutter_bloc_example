import 'package:go_router/go_router.dart';

import '../../presentation/pages/feed/feed_page.dart';
import '../../presentation/pages/login/login_page.dart';
import '../../presentation/pages/number_trivia_page.dart';
import '../../presentation/pages/second/second.dart';
import '../../presentation/pages/splash/splash_page.dart';

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
        builder: (context, state) => const FeedPage(),
      ),
      GoRoute(
        path: '/second',
        name: 'second',
        builder: (context, state) => const SecondPage(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
    ],
  );
}
