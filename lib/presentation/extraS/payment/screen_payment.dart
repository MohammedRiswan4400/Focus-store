// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:focus_store/presentation/navigaion/screen_navigation_page.dart';
import 'package:lottie/lottie.dart';

import '../../../core/color/colors.dart';
import '../../../core/widgets/focus_widgets.dart';
import '../widgets/extra_screens_main_widgets.dart';

class ScreenPayment extends StatelessWidget {
  const ScreenPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const AppbarPop(),
        title: AppBArTitle(
          title: 'Payment Methods',
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: appBarBackground,
        shadowColor: colorTransperant,
        toolbarHeight: 60,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: appBarContainerColor),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Stack(
          children: [
            ListView(
              children: [
                const MySizedBox(h: 20, w: 0),
                const Center(
                  child: Text(
                    "Select the payment  method you want to use ",
                    style: TextStyle(
                      fontFamily: myFont,
                      fontSize: 14,
                    ),
                  ),
                ),
                MySizedBox(h: 30, w: 0),
                Container(
                  decoration: BoxDecoration(
                      color: navBarColor,
                      borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: ListTile(
                      leading: Image.asset(
                        "assets/cashonDelivary.png",
                        scale: 5,
                      ),
                      title: Text(
                        "Cash on Delivary ",
                        style: TextStyle(
                          fontFamily: myFont,
                          fontSize: 14,
                        ),
                      ),
                      trailing: CircleAvatar(
                        radius: 5,
                        backgroundColor: unselectedItemsColor,
                      ),
                    ),
                  ),
                ),
                MySizedBox(h: 20, w: 0),
                Container(
                  decoration: BoxDecoration(
                      color: navBarColor,
                      borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: ListTile(
                      leading: Image.asset(
                        "assets/payPal.png",
                        scale: 5,
                      ),
                      title: Text(
                        "RazorPay",
                        style: TextStyle(
                          fontFamily: myFont,
                          fontSize: 14,
                        ),
                      ),
                      trailing: CircleAvatar(
                        radius: 5,
                        backgroundColor: Color.fromARGB(255, 184, 184, 184),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: GestureDetector(
                onTap: () {
                  // gotoCartScreen(context);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Lottie.network(
                          "https://assets4.lottiefiles.com/packages/lf20_HmRWcatRRk.json",
                        ),
                        // contentPadding: EdgeInsets.all(20),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Close",
                              style: TextStyle(
                                fontFamily: myFont,
                                fontWeight: FontWeight.bold,
                                color: unselectedItemsColor,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                builder: (context) {
                                  return ScreenNavigation();
                                },
                              ), (route) => false);
                            },
                            child: Text(
                              "Done",
                              style: TextStyle(
                                fontFamily: myFont,
                                fontWeight: FontWeight.bold,
                                color: unselectedItemsColor,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color.fromARGB(255, 123, 123, 123),
                          Color.fromARGB(255, 78, 78, 78)
                        ]),
                  ),
                  height: 70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Confirm Payment",
                        style: TextStyle(
                          fontFamily: myFont,
                          color: colorWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void gotoCartScreen(BuildContext context) {
  Navigator.of(context).pop();
}
