import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:focus_store/main.dart';
import 'package:focus_store/presentation/login/services/loginscreen_services.dart';
import 'package:focus_store/presentation/login/widgets/login_screen_widgets.dart';

import '../../core/color/colors.dart';
import '../../core/widgets/focus_widgets.dart';

class ScreenForgotPassWord extends StatelessWidget {
  ScreenForgotPassWord({super.key});
  final _emailrestController = TextEditingController();
  // final _passwordRestController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
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
                height: MediaQuery.of(context).size.height / 1.9,
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
                            title: "Reset password",
                          ),
                          const MySizedBox(h: 10, w: 0),
                          const Text(
                            "Enter your Email & Reset Password",
                            style: TextStyle(
                                fontFamily: myFont,
                                fontWeight: FontWeight.bold,
                                color: colorWhite),
                          ),
                          const MySizedBox(h: 20, w: 0),
                          TextFormField(
                            obscureText: false,
                            textInputAction: TextInputAction.next,
                            controller: _emailrestController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (email) =>
                                email != null && !EmailValidator.validate(email)
                                    ? "Enter a valid email"
                                    : null,
                            decoration: InputDecoration(
                              hintText: "Email",
                              prefixIcon: const Icon(Icons.email),
                              hintStyle: const TextStyle(
                                fontFamily: "Ubuntu",
                                color: hintTextColor,
                                fontSize: 14,
                              ),
                              filled: true,
                              fillColor: navBarColor,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          const MySizedBox(h: 20, w: 0),
                          ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(navBarColor)),
                            onPressed: () {
                              // gotoScreenNavigation(context);
                              // signIn(context);
                              // log("cccccccccccccccccccccccccccccccccc");
                            },
                            child: GestureDetector(
                              onTap: () {
                                resetPassword(context);
                              },
                              child: const Text(
                                "Reset Password",
                                style: TextStyle(
                                  fontFamily: myFont,
                                  color: colorBlack,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          const MySizedBox(h: 20, w: 0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LoginLastText(
                                text: 'Goto  ',
                              ),
                              GestureDetector(
                                onTap: () {
                                  gotoSignInScren(context);
                                },
                                child: const Text(
                                  "Sign in",
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
            )
          ],
        ),
      ),
    );
  }

  Future resetPassword(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailrestController.text.trim());
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Center(
            child: Text(
              "Password Reset Email Sent",
              style: TextStyle(fontFamily: myFont, fontWeight: FontWeight.bold),
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
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
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
      Navigator.of(context).pop();
    }
  }
}

void gotoScreenPassword(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return ScreenForgotPassWord();
      },
    ),
  );
}
