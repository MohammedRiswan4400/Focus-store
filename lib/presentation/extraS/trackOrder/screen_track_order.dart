import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../core/color/colors.dart';
import '../../../core/widgets/focus_widgets.dart';
import '../widgets/extra_screens_main_widgets.dart';

class ScreenTrackOrder extends StatelessWidget {
  const ScreenTrackOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: const AppbarPop(),
          title: AppBArTitle(
            title: 'Track Order',
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
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: navBarColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 108,
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 79,
                        width: 71,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/iphoneatcart.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "iPhone 14 pro",
                          style: TextStyle(fontFamily: "Ubuntu", fontSize: 15),
                        ),
                        const MySizedBox(h: 5, w: 0),
                        const Text(
                          "256 GB",
                          style: TextStyle(fontFamily: "Ubuntu", fontSize: 12),
                        ),
                        const MySizedBox(h: 5, w: 0),
                        Row(
                          children: const [
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Color.fromARGB(190, 96, 20, 158),
                            ),
                            MySizedBox(h: 0, w: 5),
                            Text(
                              "Color",
                              style: TextStyle(
                                fontFamily: "Ubuntu",
                              ),
                            ),
                            MySizedBox(h: 0, w: 30),
                            Text(
                              "₹85,999",
                              style: TextStyle(
                                fontFamily: "Ubuntu",
                              ),
                            ),
                            MySizedBox(h: 0, w: 25),
                            Text(
                              "Qty : 1",
                              style: TextStyle(
                                fontFamily: "Ubuntu",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const MySizedBox(h: 30, w: 0),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 139, 175, 238),
                        radius: 18,
                        child: Image.asset(
                          "assets/Screenshot_2023-04-16_072855-removebg-preview.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                      CircleAvatar(
                        // backgroundColor:
                        //     const Color.fromARGB(255, 139, 175, 238),
                        radius: 18,
                        child: Image.asset(
                          "assets/Screenshot_2023-04-16_072925-removebg-preview.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                      CircleAvatar(
                        // backgroundColor:
                        //     const Color.fromARGB(255, 139, 175, 238),
                        radius: 18,
                        child: Image.asset(
                          "assets/Screenshot_2023-04-16_072951-removebg-preview.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                      CircleAvatar(
                        // backgroundColor:
                        //     const Color.fromARGB(255, 139, 175, 238),
                        radius: 18,
                        child: Image.asset(
                          "assets/Screenshot_2023-04-16_073006-removebg-preview.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const MyDivider(),
              const MySizedBox(h: 20, w: 0),
              const MyDivider(),
              const MySizedBox(h: 20, w: 0),
              const Center(
                child: Text(
                  "Costomer Address",
                  style: TextStyle(
                      fontFamily: "Ubuntu",
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const MySizedBox(h: 20, w: 0),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: const [
                      Text(
                        "Mohammed Riswan",
                        style: TextStyle(
                          fontFamily: "Ubuntu",
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Madathodi(H) ",
                        style: TextStyle(
                          fontFamily: "Ubuntu",
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "Thiruvegappura PO",
                        style: TextStyle(
                          fontFamily: "Ubuntu",
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "Pin:679304",
                        style: TextStyle(
                          fontFamily: "Ubuntu",
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "Palakkad Dist",
                        style: TextStyle(
                          fontFamily: "Ubuntu",
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "Kerala",
                        style: TextStyle(
                          fontFamily: "Ubuntu",
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const MySizedBox(h: 20, w: 0),
              const Center(
                child: Text(
                  "Order Status",
                  style: TextStyle(
                      fontFamily: "Ubuntu",
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 139, 175, 238),
                  radius: 18,
                  child: Image.asset(
                    "assets/Screenshot_2023-04-16_072855-removebg-preview.png",
                    height: 30,
                    width: 30,
                  ),
                ),
                title: const Text(
                  "Order Packed         - 08/04/2023",
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontSize: 15,
                  ),
                ),
                subtitle: const Text(
                  "32 Kolkatta to calicut GA 30794",
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
