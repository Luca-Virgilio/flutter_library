import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';

class BodyScreen extends StatelessWidget {
  const BodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'body'),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.green[200],
              child: const Center(
                child: Text(
                  'Green 200',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.green[400],
              child: const Center(
                child: Text(
                  'Green 400',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.green[600],
              child: const Center(
                child: Text(
                  'Green 600',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.amber[200],
                  child: const Text('Text'),
                ),
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.amber[400],
                  child: const Text('Text'),
                ),
                Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      color: Colors.purple[600],
                    ),
                    Container(
                        width: 50,
                        height: 50,
                        color: Colors.purple[200],
                        child: const Text('Text')),
                    Container(
                        width: 50,
                        height: 50,
                        color: Colors.purple[100],
                        child: const Text('Text')),
                  ],
                ),
              ],
            ),
            Container(
              height: 200,
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                color: Colors.green.shade800,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: const Center(
                child: Text(
                  'Green 800',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
