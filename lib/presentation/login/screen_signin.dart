import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:focus_store/presentation/login/screen_forgot_password.dart';
import 'package:focus_store/presentation/login/widgets/login_screen_widgets.dart';
import '../../../core/color/colors.dart';
import '../../../core/widgets/focus_widgets.dart';
import '../../main.dart';

final emailController = TextEditingController();
final passWordController = TextEditingController();

class ScreenSignIn extends StatelessWidget {
  const ScreenSignIn({
    super.key,
  });

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
                height: MediaQuery.of(context).size.height / 1.4,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 30, right: 30),
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          const LogoWidget(),
                          const MySizedBox(h: 20, w: 0),
                          LoginFirstText(
                            title: "Login to Your Account",
                          ),
                          const MySizedBox(h: 20, w: 0),
                          LoginTExtField(
                            eMailValidation: AutovalidateMode.disabled,
                            obscureText: false,
                            hintText: "Email",
                            prefix: Icons.email,
                            signInController: emailController,
                          ),
                          const MySizedBox(h: 20, w: 0),
                          LoginTExtField(
                            obscureText: false,
                            eMailValidation: AutovalidateMode.disabled,
                            hintText: "Password",
                            prefix: Icons.lock_outline,
                            signInController: passWordController,
                          ),
                          const MySizedBox(h: 20, w: 0),
                          GestureDetector(
                            onTap: () {
                              gotoScreenPassword(context);
                            },
                            child: const Text(
                              "Forgot password",
                              style: TextStyle(
                                  fontFamily: myFont,
                                  fontWeight: FontWeight.bold,
                                  color: colorWhite),
                            ),
                          ),
                          const MySizedBox(h: 20, w: 0),
                          ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(navBarColor)),
                            onPressed: () {
                              // gotoScreenNavigation(context);
                              signIn(context);
                              log("cccccccccccccccccccccccccccccccccc");
                            },
                            child: const Text(
                              "Sign in",
                              style: TextStyle(
                                fontFamily: myFont,
                                color: colorBlack,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const MySizedBox(h: 20, w: 0),
                          const Text(
                            "or continue with",
                            style: TextStyle(
                                fontFamily: myFont,
                                fontWeight: FontWeight.bold,
                                color: colorWhite),
                          ),
                          const MySizedBox(h: 20, w: 0),
                          GestureDetector(
                            onTap: () {
                              gotoScreenNavigation(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: navBarColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 50,
                              width: 50,
                              child: Image.asset(
                                  "assets/Google-logo-2015-G-icon.jpg"),
                            ),
                          ),
                          const MySizedBox(h: 10, w: 0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LoginLastText(
                                text: ' Don’t have an Account?  ',
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
                      const MySizedBox(h: 30, w: 0),
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

  Future signIn(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passWordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text(
              "$e",
              style: const TextStyle(
                  fontFamily: myFont, fontWeight: FontWeight.bold),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
          behavior: SnackBarBehavior.floating,
          // width: 10,
        ),
      );
      // log(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
