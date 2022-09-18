import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_large_text.dart';
import '../../widgets/custom_app_bar.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  late int currentIndex;
  late final PageController pageController;

  @override
  void initState() {
    currentIndex = 0;
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tokenList = [
      {'title': 'Bitcoin', 'subTitle': 'BTC', 'value': '10.0'},
      {'title': 'Ethereum', 'subTitle': 'ETH', 'value': '240.0'},
      {'title': 'Luna', 'subTitle': 'LUN', 'value': '3.0'}
    ];

    return Scaffold(
      appBar: const CustomAppBar(title: 'Slider'),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        color: Colors.orange.shade100,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            AppLargeText(
              text: 'Card slider',
              color: Colors.orange.shade600,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, index) {
                    return AnimatedBuilder(
                      animation: pageController,
                      builder: (ctx, child) {
                        return child!;
                      },
                      child: Card(
                        elevation: 4,
                        color: Colors.orange.shade600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppLargeText(
                                text: tokenList[index]['subTitle']!,
                                size: 16,
                                color: Colors.white,
                              ),
                              Expanded(
                                flex: 3,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AppLargeText(
                                      text: tokenList[index]['title']!,
                                      size: 28,
                                      color: Colors.white,
                                    ),
                                    AppLargeText(
                                      text: tokenList[index]['value']!,
                                      size: 28,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: tokenList.length),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  tokenList.length,
                  (index) => Container(
                    margin: const EdgeInsets.all(2.0),
                    child: Icon(
                      Icons.circle,
                      size: 12.0,
                      color: currentIndex == index
                          ? Colors.orange.shade600
                          : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
