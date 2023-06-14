import 'package:flutter/material.dart';

import '../../navigaion/screen_navigation_page.dart';
import '../screen_login.dart';
import '../screen_main_first_login.dart';
import '../screen_signin.dart';

void gotoSignInScren(BuildContext context) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) {
        return const ScreenSignIn();
      },
    ),
  );
}

void gotoApp(BuildContext context) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) {
        return ScreenNavigation();
      },
    ),
  );
}

void gotoScreenNavigation(BuildContext context) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) {
        return ScreenNavigation();
      },
    ),
  );
}

void gotoLogIn(BuildContext context) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) {
        return const ScreenLogin();
      },
    ),
  );
}

void gotofirstLoginScreen(BuildContext context) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) {
        return const ScreenFirstLoginPage();
      },
    ),
  );
}
