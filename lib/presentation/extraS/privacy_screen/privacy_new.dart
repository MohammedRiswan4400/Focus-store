import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:focus_store/presentation/extraS/widgets/extra_screens_main_widgets.dart';

import '../../../core/color/colors.dart';

class ScreenNewPrivacy extends StatelessWidget {
  const ScreenNewPrivacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const AppbarPop(),
        title: AppBArTitle(
          title: 'Privacy Policy',
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: appBarBackground,
        shadowColor: colorTransperant,
        toolbarHeight: 60,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: appBarContainerColor),
          ),
        ),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        // child: Html(
        //   style: {"body": Style(color: colorBlack)},
        //   data: "d",
        // ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return const Column(
                  children: [
                    Text(
                      "Privacy Policy",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
