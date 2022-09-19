import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int listLength = 30;

    return Scaffold(
        appBar: const CustomAppBar(title: 'List View'),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  //simulate async call
                  await Future.delayed(const Duration(seconds: 2));
                },
                child: ListView.separated(
                    itemCount: listLength,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                          height: 2,
                        ),
                    itemBuilder: (_, int index) {
                      return ListTile(
                          onTap: () => log('click item $index'),
                          onLongPress: () {
                            log('long press item $index');
                          },
                          tileColor: Colors.orange.shade200,
                          leading: Text('item $index'));
                    }),
              ),
            ),
          ],
        ));
  }
}
