import 'package:flutter/material.dart';

import '../../../core/color/colors.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (BuildContext context, int newIndex, _) {
        return BottomNavigationBar(
          onTap: (index) {
            indexChangeNotifier.value = index;
          },
          currentIndex: newIndex,
          elevation: 0,
          backgroundColor: navBarColor,
          iconSize: 28,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 8,
          unselectedFontSize: 8,
          selectedItemColor: mainBlue,
          unselectedItemColor: unselectedItemsColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.layers_rounded),
              label: "Category",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_rounded),
              label: "Notifications",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_rounded),
              label: "Order",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              label: "Account",
            ),
          ],
        );
      },
    );
  }
}
