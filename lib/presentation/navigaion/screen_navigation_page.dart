import 'package:flutter/material.dart';
import 'package:focus_store/presentation/category/screen_category.dart';
import 'package:focus_store/presentation/home/screen_home.dart';
import 'package:focus_store/presentation/notifications/screen_notificaion.dart';
import '../../core/color/colors.dart';
import '../account/screen_account.dart';
import '../order/screen_oorder.dart';
import 'widgets/screen_navigation.dart';

class ScreenNavigation extends StatelessWidget {
  ScreenNavigation({super.key});

  final _pages = [
    const ScreenHome(),
    const ScreenCategory(),
    const ScreenNotification(),
    const ScreenOorder(),
    const ScreenAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundScaffoldColor,
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, _) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: const NavigationScreen(),
    );
  }
}
