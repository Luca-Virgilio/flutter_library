import 'package:flutter/material.dart';
import '../misc/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    Key key = const Key('AppBarKey'),
    this.title = 'My widgets',
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60); // default is 56.0

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.mainColor,
      automaticallyImplyLeading: true,
      centerTitle: true,
      title: Text(title),
      elevation: 0,
    );
  }
}
