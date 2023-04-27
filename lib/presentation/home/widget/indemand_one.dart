import 'package:flutter/material.dart';

import '../../../core/color/colors.dart';

class InDemandContainerOne extends StatelessWidget {
  const InDemandContainerOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: navBarColor,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 250,
      width: MediaQuery.of(context).size.width / 2.15,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          "assets/sr3Ultra.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
