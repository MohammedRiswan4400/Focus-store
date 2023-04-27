import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:focus_store/presentation/extraS/searchScreen/widgets/search_screen_appbar.dart';

import '../../../core/color/colors.dart';
import '../../home/widget/home_widgets.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const SearchScreenAppbar(),
        backgroundColor: Colors.white.withAlpha(200),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        shadowColor: colorTransperant,
        toolbarHeight: 60,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              child: ListView(
                physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
                children: [
                  GridView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1.0,
                            crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return const NewArrivalPhones();
                    },
                    itemCount: 7,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
