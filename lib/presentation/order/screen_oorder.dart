// ignore_for_file: unused_import

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:focus_store/core/widgets/focus_widgets.dart';
import 'package:focus_store/presentation/extraS/payment/screen_payment.dart';
import 'package:focus_store/presentation/order/widgets/order_screen_widgets.dart';
import 'package:lottie/lottie.dart';
import '../../core/color/colors.dart';
import '../extraS/searchScreen/screen_search.dart';

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
    return StreamBuilder(
        stream: fetchDataFromOrderdList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData) {
            final orderList = snapshot.data;
            if (orderList == null) {
              return const Center(child: Text("Empty"));
            } else {
              if (orderList.isEmpty) {
                return Lottie.network(
                  "https://assets10.lottiefiles.com/packages/lf20_9nP76E1BYh.json",
                );
              } else {
                return ListView.builder(
                  itemCount: orderList.length,
                  itemBuilder: (context, index) {
                    final orderData = orderList[index];
                    return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: ActiveOrderContainer(
                          orderList: orderData,
                        ));
                  },
                );
              }
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  completedTabBarView() {
    return StreamBuilder(
        stream: fetchCompletedFromOrderdList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            final orderList = snapshot.data;
            if (orderList == null) {
              return const Center(
                child: Text(
                  "Empty",
                ),
              );
            } else {
              if (orderList.isEmpty) {
                return Lottie.network(
                  "https://assets10.lottiefiles.com/packages/lf20_9nP76E1BYh.json",
                );
              } else {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final completedOrders = orderList[index];
                    return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: CompletedOrderContainer(
                          orderCompleted: completedOrders,
                        ));
                  },
                  itemCount: orderList.length,
                );
              }
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

Stream<List<OrderModel>> fetchDataFromOrderdList() => FirebaseFirestore.instance
    .collection("Orders")
    .where(
      "isCAncelled",
      isEqualTo: false,
    )
    .where("isCompleted", isEqualTo: false)
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => OrderModel.fromJson(doc.data())).toList());

Stream<List<OrderModel>> fetchCompletedFromOrderdList() => FirebaseFirestore
    .instance
    .collection("Orders")
    .where(
      "isCompleted",
      isEqualTo: true,
    )
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => OrderModel.fromJson(doc.data())).toList());
