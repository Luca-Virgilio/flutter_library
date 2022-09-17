import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_widgets/model/my_navbar_item.dart';
import 'package:go_router/go_router.dart';

import '../model/example_item.dart';

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
    final List<ExampleItem> examples = [
      ExampleItem(name: 'Row & column', route: '/style/body'),
      ExampleItem(name: 'Text', route: '/style/text'),
      ExampleItem(name: 'Flex', route: '/style/flex'),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('my flutter library'),
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text('Examples to handle Rows, columns, and text style...'),
              const SizedBox(
                height: 20,
              ),
              ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: examples.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      context.go(examples[index].route);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.green.shade800,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text(
                          examples[index].name,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            ],
          ),
        ),
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
