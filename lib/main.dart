import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/core/theme/color_schemes.dart';
import 'package:flutter_bloc_example/presentation/bloc/language/localization_bloc.dart';
import 'package:flutter_bloc_example/presentation/bloc/theme/theme_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'core/enums/theme.dart';
import 'core/route/route.dart';
import 'injection_container.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  // Bloc.observer = SimpleBlocObserver();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ThemeBloc>(
        create: (context) => ThemeBloc(),
      ),
      BlocProvider<LanguageBloc>(
        create: (context) => LanguageBloc(),
      ),
    ],
    child: MyApp(),
  ));
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- ${bloc.runtimeType}');
  }
}

@immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRoute = AppRouter().router;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, Locale>(
      builder: (BuildContext context, Locale state) {
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, tState) {
            return MaterialApp.router(
              routerConfig: appRoute,
              title: 'Number Trivia',
              theme: ThemeData(colorScheme: lightColorScheme),
              darkTheme: ThemeData(colorScheme: darkColorScheme),
              themeMode: tState is ThemeChanges ? tState.selectedTheme.value : AppThemeMode.light.value,
              localizationsDelegates: [
                FlutterI18nDelegate(
                  translationLoader: FileTranslationLoader(
                    useCountryCode: false,
                    basePath: 'assets/flutter_i18n',
                    forcedLocale: state,
                  ),
                ),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
            );
          },
        );
      },
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
