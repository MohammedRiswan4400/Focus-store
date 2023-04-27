import 'package:flutter/material.dart';

import '../../../core/color/colors.dart';

class InDemandContainerTwo extends StatelessWidget {
  const InDemandContainerTwo({
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          "assets/oppoencoX.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
