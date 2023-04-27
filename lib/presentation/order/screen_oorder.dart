// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:focus_store/core/widgets/focus_widgets.dart';
import 'package:focus_store/presentation/order/widgets/order_screen_widgets.dart';
import '../../core/color/colors.dart';

class ScreenOorder extends StatefulWidget {
  const ScreenOorder({super.key});

  @override
  State<ScreenOorder> createState() => _ScreenOorderState();
}

class _ScreenOorderState extends State<ScreenOorder> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: navBarColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const OrderTitle(),
          centerTitle: true,
          backgroundColor: colorWhite,
          bottom: const TabBar(
              // isScrollable: true,
              labelStyle:
                  TextStyle(fontFamily: "Ubuntu", fontWeight: FontWeight.bold),
              indicatorColor: unselectedItemsColor,
              indicatorPadding: EdgeInsets.only(left: 40, right: 40),
              tabs: [
                Tab(
                  text: "Active",
                ),
                Tab(
                  text: "Completed",
                )
              ]),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: TabBarView(children: [
            activeTabBarView(),
            // _buildTabBarView("Completed"),
            completedTabBarView(),
          ]),
        ),
      ),
    );
  }

  activeTabBarView() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: ActiveOrderContainer());
      },
      itemCount: 10,
    );
  }

  completedTabBarView() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: CompletedOrderContainer());
      },
      itemCount: 10,
    );
  }
}
