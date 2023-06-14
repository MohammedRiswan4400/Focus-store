import 'package:flutter/material.dart';
import 'package:focus_store/core/color/colors.dart';
import 'package:focus_store/core/widgets/focus_widgets.dart';
import 'package:focus_store/presentation/login/services/loginscreen_services.dart';
import 'package:focus_store/presentation/login/widgets/login_screen_widgets.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                "assets/IMG_1527.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                    color: splahBlue,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40))),
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 40, right: 40),
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          const LogoWidget(),
                          const MySizedBox(h: 20, w: 0),
                          LoginFirstText(
                            title: "Let's you in",
                          ),
                          const MySizedBox(h: 20, w: 0),
                          ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(navBarColor)),
                            onPressed: () {
                              // gotoScreenNavigation(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/Google-logo-2015-G-icon.jpg",
                                  height: 40,
                                  width: 40,
                                ),
                                const Text(
                                  "Continue with Google",
                                  style: TextStyle(
                                      fontFamily: myFont, color: colorBlack),
                                ),
                              ],
                            ),
                          ),
                          const MySizedBox(h: 20, w: 0),
                          const Text(
                            "or",
                            style: TextStyle(
                                fontFamily: myFont,
                                fontWeight: FontWeight.bold,
                                color: colorWhite),
                          ),
                          const MySizedBox(h: 20, w: 0),
                          ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(navBarColor)),
                            onPressed: () {
                              gotoSignInScren(context);
                              // gotofirstLoginScreen(context);
                            },
                            child: const Text(
                              "Sign in with password",
                              style: TextStyle(
                                fontFamily: myFont,
                                color: colorBlack,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const MySizedBox(h: 10, w: 0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LoginLastText(
                                text: ' Don’t have an Account? ',
                              ),
                              GestureDetector(
                                onTap: () {
                                  gotoCreateAccount(context);
                                },
                                child: const Text(
                                  "Sign up",
                                  style: TextStyle(
                                      fontFamily: myFont,
                                      color: colorWhite,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
