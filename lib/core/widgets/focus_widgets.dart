import 'package:flutter/material.dart';

class MySizedBox extends StatelessWidget {
  const MySizedBox({
    super.key,
    required this.h,
    required this.w,
  });

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      width: w,
    );
  }
}

class MyDivider extends StatelessWidget {
  const MyDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color.fromARGB(118, 132, 132, 132),
      thickness: 1.3,
    );
  }
}

const String myFont = "Ubuntu";
