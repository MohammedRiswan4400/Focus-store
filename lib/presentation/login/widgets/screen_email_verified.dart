import 'package:flutter/material.dart';
import 'package:focus_store/core/color/colors.dart';
import 'package:focus_store/core/widgets/focus_widgets.dart';
import 'package:lottie/lottie.dart';

import '../../navigaion/screen_navigation_page.dart';

class ScreenEmailVerified extends StatefulWidget {
  const ScreenEmailVerified({super.key});

  @override
  State<ScreenEmailVerified> createState() => _ScreenEmailVerifiedState();
}

class _ScreenEmailVerifiedState extends State<ScreenEmailVerified> {
  @override
  void initState() {
    gotoNavigationFromVerifiedScreens(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "assets/IMG_1527.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: colorWhite,
                ),
                child: Column(
                  children: [
                    const MySizedBox(h: 10, w: 0),
                    const Text(
                      "Email address verified",
                      style: TextStyle(
                          fontFamily: myFont,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Lottie.network(
                          "https://assets6.lottiefiles.com/packages/lf20_9n1h4nww.json"),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Future gotoNavigationFromVerifiedScreens(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 4));
  // ignore: use_build_context_synchronously
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) {
        // return
        return ScreenNavigation();
      },
    ),
  );
}

// Future gotoNavigationFromVerifiedScrees(BuildContext context) async {
//   await Future.delayed(const Duration(seconds: 3));
//   // ignore: use_build_context_synchronously
//   Navigator.of(context).pushre(MaterialPageRoute(
//     builder: (context) {
//       return ScreenNavigation();
//     },
//   ), (route) => false);
// }
