import 'package:flutter/material.dart';

import '../../../../core/color/colors.dart';

class AppbarPop extends StatelessWidget {
  const AppbarPop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: colorBlack,
      ),
    );
  }
}

// ignore: must_be_immutable
class AppBArTitle extends StatelessWidget {
  String title;
  AppBArTitle({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontFamily: "Ubuntu",
        color: colorBlack,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
