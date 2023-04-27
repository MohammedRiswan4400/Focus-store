import 'package:flutter/material.dart';
import 'package:focus_store/presentation/login/screen_login.dart';
import '../../../core/color/colors.dart';
import '../../../core/widgets/focus_widgets.dart';
import '../../navigaion/screen_navigation_page.dart';
import '../screen_create_account.dart';
import '../screen_main_first_login.dart';
import '../screen_signin.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/focusSplash.png.jpg",
      scale: 12,
    );
  }
}

// ignore: must_be_immutable
class LoginLastText extends StatelessWidget {
  String text;
  LoginLastText({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: myFont,
        color: colorWhite,
        fontSize: 14,
      ),
    );
  }
}

// ignore: must_be_immutable
class LoginFirstText extends StatelessWidget {
  String title;
  LoginFirstText({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          fontFamily: myFont,
          color: colorWhite,
          fontWeight: FontWeight.bold,
          fontSize: 25),
    );
  }
}

void gotoCreateAccount(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return ScreenCreateAccount();
      },
    ),
  );
}

// ignore: must_be_immutable
class LoginTExtField extends StatelessWidget {
  String hintText;
  AutovalidateMode eMailValidation;
  IconData prefix;
  bool obscureText;
  TextEditingController signInController;
  LoginTExtField({
    required this.obscureText,
    required this.eMailValidation,
    required this.hintText,
    required this.prefix,
    required this.signInController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(height: 45),
      child: TextFormField(
        obscureText: obscureText,
        textInputAction: TextInputAction.next,
        controller: signInController,
        autovalidateMode: eMailValidation,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(prefix),
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
    );
  }
}

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
