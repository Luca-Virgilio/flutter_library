import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/model/my_navbar_item.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static List<MyNavbarItem> mainTopic = [
    MyNavbarItem(label: 'home', icon: Icons.home, route: '/'),
    MyNavbarItem(
        label: 'internalDB',
        icon: Icons.table_chart,
        route: '/stateManagement'),
  ];

  void changeRoute(index, BuildContext context) {
    String goTo = mainTopic[index].route;
    log('change route $index $goTo');
    context.go(goTo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('my flutter widget'),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => changeRoute(index, context), //New
          items: mainTopic
              .map((ele) => BottomNavigationBarItem(
                    icon: Icon(ele.icon),
                    label: ele.label,
                  ))
              .toList()),
    );
  }
}
