import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../model/example_item.dart';
import '../../widgets/custom_app_bar.dart';

class ComponentListScreen extends StatelessWidget {
  const ComponentListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ExampleItem> examples = [];

    return Scaffold(
      appBar: const CustomAppBar(title: 'Components'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text('Examples of flutter components'),
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
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
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
    );
  }
}
