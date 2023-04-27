import 'package:flutter/material.dart';

import '../../../core/color/colors.dart';

class InDemandContainerThree extends StatelessWidget {
  const InDemandContainerThree({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: navBarColor,
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(width: 3, color: navBarColor),
      ),
      height: 120,
      width: MediaQuery.of(context).size.width / 2.15,
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 2, left: 2, right: 2),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            "assets/samsungWatches.png",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
