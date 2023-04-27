// ignore_for_file: use_build_context_synchronously

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:focus_store/presentation/login/widgets/login_screen_widgets.dart';
import '../../core/color/colors.dart';
import '../../core/widgets/focus_widgets.dart';
import '../../main.dart';

final formKey = GlobalKey<FormState>();

class ScreenCreateAccount extends StatelessWidget {
  ScreenCreateAccount({
    super.key,
  });

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
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
                height: MediaQuery.of(context).size.height / 1.3,
                width: double.infinity,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8, left: 30, right: 30, bottom: 40),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            const LogoWidget(),
                            const MySizedBox(h: 15, w: 0),
                            LoginFirstText(
                              title: "Create Your Account",
                            ),
                            const MySizedBox(h: 20, w: 0),
                            TextFormField(
                              obscureText: false,
                              textInputAction: TextInputAction.next,
                              controller: _emailController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (email) => email != null &&
                                      !EmailValidator.validate(email)
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
                            const MySizedBox(h: 10, w: 0),
                            TextFormField(
                              obscureText: false,
                              textInputAction: TextInputAction.next,
                              controller: _passwordController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) =>
                                  value != null && value.length < 6
                                      ? "Enter min 6 charecter"
                                      : null,
                              decoration: InputDecoration(
                                hintText: "Password",
                                prefixIcon: const Icon(Icons.lock_open_rounded),
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
                            const MySizedBox(h: 10, w: 0),
                            TextFormField(
                              // obscureText: true,
                              textInputAction: TextInputAction.next,
                              controller: _confirmPasswordController,
                              decoration: InputDecoration(
                                hintText: "Confirm Password",
                                prefixIcon: const Icon(Icons.lock_outline),
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
                                // log(".......................Pressed.........................."
                                //     as num);
                                signUp(context);
                              },
                              child: const Text(
                                "Sign Up",
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
                                  text: ' Already have an account? ',
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future signUp(BuildContext context) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    if (_passwordController.text != _confirmPasswordController.text) {
      return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Center(
            child: Text(
              "Passwords are not matching",
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
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      // print(e);

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
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);

    // gotoSignInScren(context);
    // Navigator.of(context).pop();
    // gotoScreenNavigation(context);
  }
}

// class Utils {
//   static showSnackBar(String? text) {
//     if (text == null) return;
//     final snackBar = SnackBar(
//       content: Text(text),
//       backgroundColor: colorRed,
//     );

//     messengerKey.currentState!
//       ..removeCurrentSnackBar()
//       ..showSnackBar(snackBar);
//   }
// }

// final messengerKey = GlobalKey<ScaffoldMessengerState>();
