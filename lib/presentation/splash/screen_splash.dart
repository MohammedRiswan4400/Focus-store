import 'package:flutter/material.dart';
import 'package:focus_store/core/color/colors.dart';
import '../login/screen_main_first_login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gotoScreens(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: splahBlue,
        body: Center(
          child: ListView(
            children: [
              Column(
                // mainAxisAlignment: ,
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  Image.asset(
                    "assets/focusSplash.png.jpg",
                    height: 80,
                    width: 80,
                  ),
                  const SizedBox(height: 350),
                  const Text(
                    "focus store",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colorWhite,
                      fontSize: 30,
                      fontFamily: "Ubuntu",
                    ),
                  ),
                  const Text(
                    "Change Your Tech Experience",
                    style: TextStyle(
                      color: colorWhite,
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                      fontFamily: "Ubuntu",
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

Future gotoScreens(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 3));
  // ignore: use_build_context_synchronously
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) {
        // return
        return const ScreenFirstLoginPage();
      },
    ),
  );
}
