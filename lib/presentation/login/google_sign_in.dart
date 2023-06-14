import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogelSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    log("aaaaaaaaaaaaa");
    final googleUser = await googleSignIn.signIn();
    log("1");
    if (googleUser == null) return;
    log("2");
    _user = googleUser;
    log("3");
    final googleAuth = await googleUser.authentication;
    log("4");
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    log("5");
    await FirebaseAuth.instance.signInWithCredential(credential);
    log("6");
    notifyListeners();
  }
}
