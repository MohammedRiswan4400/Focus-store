import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:focus_store/core/color/colors.dart';
import 'presentation/splash/screen_splash.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      title: "focus store",
      theme: ThemeData(
          primaryColor: Colors.amber,
          scaffoldBackgroundColor: backgroundScaffoldColor),
      home: const SplashScreen(),
    );
  }
}
