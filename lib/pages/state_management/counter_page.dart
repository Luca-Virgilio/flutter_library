import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repository/counter_notifier.dart';
import '../../widgets/custom_app_bar.dart';

class CounterPage extends ConsumerStatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends ConsumerState<CounterPage> {
  @override
  Widget build(BuildContext context) {
    int value = ref.watch(counterProvider.state).state;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Simple counter'),
      body: Center(
        child: Text('$value'),
      ),
      floatingActionButton: FloatingActionButton(
        // The read method is an utility to read a provider without listening to it
        onPressed: () {
          ref.read(counterProvider.state).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
