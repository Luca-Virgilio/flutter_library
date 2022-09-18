import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgets/widgets/custom_app_bar.dart';
import 'package:go_router/go_router.dart';

import '../../repository/state_management_notifier.dart';

class StateManagementScreen extends ConsumerWidget {
  StateManagementScreen({Key? key}) : super(key: key);

  final List<String> entries = <String>['A', 'B', 'C'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'internalDB'),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('The internal DB used is riverpod.'),
            const SizedBox(
              height: 20,
            ),
            const Text('Please select an example from the list'),
            const SizedBox(
              height: 20,
            ),
            ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: ref.read(exampleListProvider).length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    context.go(ref.read(exampleListProvider)[index].route);
                  },
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text(ref.read(exampleListProvider)[index].name),
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
