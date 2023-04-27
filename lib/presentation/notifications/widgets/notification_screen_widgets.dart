import 'package:flutter/material.dart';

import '../../../core/color/colors.dart';

class NotificationTitle extends StatelessWidget {
  const NotificationTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Notifications",
      style: TextStyle(
        fontFamily: "Ubuntu",
        color: colorBlack,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
