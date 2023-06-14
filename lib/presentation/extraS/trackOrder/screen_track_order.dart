import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:focus_store/presentation/extraS/payment/screen_payment.dart';
import 'package:im_stepper/stepper.dart';
import '../../../core/color/colors.dart';
import '../../../core/widgets/focus_widgets.dart';
import '../widgets/extra_screens_main_widgets.dart';

class ScreenTrackOrder extends StatelessWidget {
  const ScreenTrackOrder({
    super.key,
    required this.order,
  });

  final OrderModel order;

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                            child: Image.network(
                              order.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.productName,
                            style: const TextStyle(
                                fontFamily: "Ubuntu", fontSize: 15),
                          ),
                          const MySizedBox(h: 5, w: 0),
                          Text(
                            // ignore: unnecessary_string_interpolations
                            "${order.storage}",
                            style: const TextStyle(
                                fontFamily: "Ubuntu", fontSize: 12),
                          ),
                          const MySizedBox(h: 5, w: 0),
                          Text(
                            "₹ ${order.price}",
                            style: const TextStyle(
                              fontFamily: "Ubuntu",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            // left: 10,
                            right: 20,
                            bottom: 20),
                        child: Text(
                          "Qty : ${order.cartCount}",
                          style: const TextStyle(
                            fontFamily: "Ubuntu",
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const MySizedBox(h: 30, w: 0),
            ImageStepper(
              enableNextPreviousButtons: false,
              // enableStepTapping: false,
              steppingEnabled: true,
              stepRadius: 20,
              // stepColor: Color.fromARGB(255, 251, 0, 0),
              activeStep: order.deliveryProcess,
              activeStepBorderColor: colorBlack,
              activeStepColor: Colors.amber,
              lineColor: Colors.black,
              direction: Axis.horizontal,
              images: const [
                AssetImage(
                    "assets/Screenshot_2023-04-16_072855-removebg-preview.png"
                    // "assets/Screenshot_2023-04-16_072855-removebg-preview.png"
                    ),
                AssetImage(
                    "assets/Screenshot_2023-04-16_072925-removebg-preview.png" // "assets/Screenshot_2023-04-16_072855-removebg-preview.png"
                    ),
                AssetImage(
                    "assets/Screenshot_2023-04-16_072951-removebg-preview.png" // "assets/Screenshot_2023-04-16_072855-removebg-preview.png"
                    ),
                AssetImage(
                    // "assets/Screenshot_2023-04-16_072855-removebg-preview.png"
                    "assets/Screenshot_2023-04-16_073006-removebg-preview.png"),
              ],
            ),
            // const MySizedBox(h: 20, w: 0),
            const MySizedBox(h: 10, w: 0),
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Address: ",
                          style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          order.address,
                          style: const TextStyle(
                            fontFamily: "Ubuntu",
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
