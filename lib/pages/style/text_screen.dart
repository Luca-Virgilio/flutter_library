import 'package:flutter/material.dart';
import 'package:flutter_widgets/misc/app_colors.dart';
import 'package:flutter_widgets/widgets/app_large_text.dart';

import '../../widgets/custom_app_bar.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'body'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            color: Colors.amber,
            padding: const EdgeInsets.all(10),
            child: Center(
              child: AppLargeText(
                text: 'Title',
                color: AppColors.mainColor,
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
