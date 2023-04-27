import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:focus_store/presentation/login/screen_signin.dart';
import 'package:focus_store/presentation/login/widgets/screen_verify_emailpage.dart';

class ScreenFirstLoginPage extends StatefulWidget {
  const ScreenFirstLoginPage({super.key});

  @override
  State<ScreenFirstLoginPage> createState() => _ScreenFirstLoginPageState();
}

class _ScreenFirstLoginPageState extends State<ScreenFirstLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Somthing Went Wrong"),
            );
          } else if (snapshot.hasData) {
            return
                // ScreenNavigation();
                const ScreenVerifyEmailPage();
          } else {
            return const ScreenSignIn();
          }
        },
      ),
    );
  }
}
