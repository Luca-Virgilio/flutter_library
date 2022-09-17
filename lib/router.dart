import 'package:flutter/cupertino.dart';
import 'package:flutter_widgets/pages/components/component_list_page.dart';
import 'package:flutter_widgets/pages/home_screen.dart';
import 'package:flutter_widgets/pages/state_management/counter_page.dart';
import 'package:flutter_widgets/pages/state_management/state_management_screen.dart';
import 'package:flutter_widgets/pages/state_management/todo_list_page.dart';
import 'package:flutter_widgets/pages/style/body_screen.dart';
import 'package:flutter_widgets/pages/style/flex_screen.dart';
import 'package:flutter_widgets/pages/style/text_screen.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> routes = <GoRoute>[
  GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
      routes: [
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
        GoRoute(
          path: 'style/flex',
          builder: (BuildContext context, GoRouterState state) =>
              const FlexScreen(),
        ),
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
            path: 'components',
            builder: (BuildContext context, GoRouterState state) =>
                ComponentListScreen()),
      ]),
];
