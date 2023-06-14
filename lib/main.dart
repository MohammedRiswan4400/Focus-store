import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:focus_store/application/address_controller/address_provider.dart';
import 'package:focus_store/core/color/colors.dart';
import 'package:focus_store/presentation/login/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'presentation/splash/screen_splash.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<GoogelSignInProvider>(
            create: (_) => GoogelSignInProvider(),
          ),
          Provider<AddressPicker>(create: (_) => AddressPicker()),
        ],
        // ChangeNotifierProvider(
        //     create: (context) => GoogelSignInProvider(),
        child: MaterialApp(
          // scaffoldMessengerKey: Utils.messengerKey,
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          title: "focus store",
          theme: ThemeData(
              primaryColor: Colors.amber,
              scaffoldBackgroundColor: backgroundScaffoldColor),
          home: const SplashScreen(),
        ));
  }
}
