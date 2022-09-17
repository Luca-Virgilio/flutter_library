import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgets/pages/home_screen.dart';
import 'package:flutter_widgets/pages/state_management/counter_page.dart';
import 'package:flutter_widgets/pages/state_management/state_management_screen.dart';
import 'package:flutter_widgets/pages/state_management/todo_list_page.dart';
import 'package:flutter_widgets/pages/style/body_screen.dart';
import 'package:flutter_widgets/pages/style/text_screen.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(
    ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter widgets',
      theme: ThemeData(
        primarySwatch: Colors.green,
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
              const HomeScreen(),
          routes: [
            GoRoute(
                path: 'stateManagement',
                builder: (BuildContext context, GoRouterState state) =>
                    StateManagementScreen(),
                routes: [
                  GoRoute(
                    path: 'counter',
                    builder: (BuildContext context, GoRouterState state) =>
                        const CounterPage(),
                  ),
                  GoRoute(
                    path: 'todoList',
                    builder: (BuildContext context, GoRouterState state) =>
                        const TodoListPage(),
                  ),
                ]),
            GoRoute(
              path: 'style/body',
              builder: (BuildContext context, GoRouterState state) =>
                  const BodyScreen(),
            ),
            GoRoute(
              path: 'style/text',
              builder: (BuildContext context, GoRouterState state) =>
                  const TextScreen(),
            ),
          ]),
    ],
  );
}
