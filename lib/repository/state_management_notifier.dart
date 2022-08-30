import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/example_item.dart';

final exampleListProvider = Provider<List<ExampleItem>>((ref) {
  List<ExampleItem> examples = [
    ExampleItem(name: 'Simple counter', route: '/stateManagement/counter'),
  ];

  return examples;
});
