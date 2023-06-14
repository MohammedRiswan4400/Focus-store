import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:focus_store/presentation/login/screen_forgot_password.dart';
import 'package:focus_store/presentation/login/widgets/login_screen_widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import '../../../core/color/colors.dart';
import '../../../core/widgets/focus_widgets.dart';
import '../../main.dart';
import 'google_sign_in.dart';

final emailController = TextEditingController();
final passWordController = TextEditingController();
final googleSignIn = GoogleSignIn();

GoogleSignInAccount? _user;

GoogleSignInAccount get user => _user!;

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
                          TextFormField(
                            // obscureText: true,
                            textInputAction: TextInputAction.next,
                            controller: emailController,
                            // autovalidateMode: eMailValidation,
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
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 14,
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 229, 229, 229),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          const MySizedBox(h: 20, w: 0),
                          TextFormField(
                            obscureText: true,
                            textInputAction: TextInputAction.next,
                            controller: passWordController,
                            // autovalidateMode: eMailValidation,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) =>
                                value != null && value.length < 6
                                    ? "Enter min 6 charecter"
                                    : null,
                            decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                              ),
                              hintStyle: const TextStyle(
                                fontFamily: "Ubuntu",
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 14,
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 229, 229, 229),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                            ),
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
                              // gotoScreenNavigation(context);
                              // log("ggggggggggggggggggggggggggggggggggggg");
                              final provider =
                                  Provider.of<GoogelSignInProvider>(context,
                                      listen: false);
                              provider.googleLogin();
                              // googlelLogin();
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

  // Future googlelLogin() async {
  //   log("aaaaaaaaaaaaaaaaa");
  //   final googleUser = await googleSignIn.signIn();
  //   log("bbbbbbbbbbbbbbbbb");
  //   if (googleUser == null) {
  //     return log("google User null");
  //   }
  //   _user = googleUser;
  //   final googleAuth = await googleUser.authentication;
  //   log("ddddddddddddddddddddddd");

  //   final credential = await GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );

  //   await FirebaseAuth.instance.signInWithCredential(credential);

  //   // notifyListeners();
  // }

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
