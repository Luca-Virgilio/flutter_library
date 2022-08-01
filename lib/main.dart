import 'package:flutter/material.dart';
import 'package:flutter_widgets/pages/home_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,

      //home: const HomeScreen(title: 'Flutter Widgets'),
    );
  }
  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
        const HomeScreen(title: 'Flutter widgets'),
      ),
    ],
  );
}

