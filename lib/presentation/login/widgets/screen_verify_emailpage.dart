import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../core/color/colors.dart';
import '../../../core/widgets/focus_widgets.dart';
import '../../navigaion/screen_navigation_page.dart';
import 'login_screen_widgets.dart';

class ScreenVerifyEmailPage extends StatefulWidget {
  const ScreenVerifyEmailPage({super.key});

  @override
  State<ScreenVerifyEmailPage> createState() => _ScreenVerifyEmailPageState();
}

class _ScreenVerifyEmailPageState extends State<ScreenVerifyEmailPage> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
          const Duration(seconds: 3), (_) => checkEmailVerified());
    }
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() => canResendEmail = false);
      await Future.delayed(const Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } catch (e) {
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
  }

  @override
  Widget build(BuildContext context) {
    return isEmailVerified
        ?
        // const ScreenEmailVerified()zzz
        // goingToNavigation()
        ScreenNavigation()
        : Scaffold(
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
                      height: MediaQuery.of(context).size.height / 2.3,
                      width: double.infinity,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 30, right: 30),
                        child: ListView(
                          children: [
                            Column(
                              children: [
                                const LogoWidget(),
                                const MySizedBox(h: 20, w: 0),
                                LoginFirstText(
                                  title: "Verify Email",
                                ),
                                const MySizedBox(h: 20, w: 0),
                                const Text(
                                  "A verification email has been send your email.",
                                  style: TextStyle(
                                      fontFamily: myFont,
                                      fontWeight: FontWeight.bold,
                                      color: colorWhite),
                                ),
                                const MySizedBox(h: 20, w: 0),
                                ElevatedButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          navBarColor)),
                                  onPressed: canResendEmail
                                      ? sendVerificationEmail
                                      : null,
                                  child: const Text(
                                    "Resend Email",
                                    style: TextStyle(
                                      fontFamily: myFont,
                                      color: colorBlack,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const MySizedBox(h: 10, w: 0),
                                ElevatedButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          navBarColor)),
                                  onPressed: () =>
                                      FirebaseAuth.instance.signOut(),
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(
                                      fontFamily: myFont,
                                      color: colorBlack,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const MySizedBox(
                                  h: 40,
                                  w: 0,
                                ),
                              ],
                            ),
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
}
