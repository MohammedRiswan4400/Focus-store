// ignore_for_file: must_be_immutable

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:focus_store/core/widgets/focus_widgets.dart';
import 'package:focus_store/presentation/category/widget/category_screen_widgets.dart';
import '../../core/color/colors.dart';

class ScreenCategory extends StatelessWidget {
  const ScreenCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withAlpha(400),
        shadowColor: colorTransperant,
        toolbarHeight: 30,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: const Color.fromARGB(128, 255, 255, 255),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: const [
            CategoryFirstWidget(),
            MySizedBox(h: 10, w: 0),
            CategorySecondWidget(),
            MySizedBox(h: 10, w: 0),
            CategoryThirdWidget(),
            MySizedBox(h: 10, w: 0),
          ],
        ),
      ),
    );
  }
}
