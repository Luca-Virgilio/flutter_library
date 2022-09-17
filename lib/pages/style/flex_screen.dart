import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';

class FlexScreen extends StatelessWidget {
  const FlexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Flex'),
      body: Column(
        children: [
          Container(
            height: 100,
            color: Colors.red.shade400,
            child: const Center(
              child: Text(
                'h:100px - Fixed Height',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 75,
              color: Colors.blue.shade200,
              child: const Center(
                child: Text(
                  'h:75px - Expanded 1 (+50%) - 1/5',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              height: 200,
              color: Colors.blue.shade400,
              child: const Center(
                child: Text(
                  'h:200px - Flex 1 - 1/5',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.blue.shade200,
              child: const Center(
                child: Text(
                  'no height - Expanded 3 - 3/5',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
