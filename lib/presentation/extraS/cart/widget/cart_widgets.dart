import 'package:flutter/material.dart';
import 'package:focus_store/presentation/extraS/payment/screen_payment.dart';

import '../../../../core/color/colors.dart';
import '../../../../core/widgets/focus_widgets.dart';
import '../screen_checkout.dart';

class CartContainer extends StatelessWidget {
  const CartContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: navBarColor, borderRadius: BorderRadius.circular(10)),
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
                children: [
                  const CircleAvatar(
                    radius: 10,
                    backgroundColor: Color.fromARGB(190, 96, 20, 158),
                  ),
                  const MySizedBox(h: 0, w: 5),
                  const Text(
                    "Color",
                    style: TextStyle(
                      fontFamily: "Ubuntu",
                    ),
                  ),
                  const MySizedBox(h: 0, w: 50),
                  const Text(
                    "₹85,999",
                    style: TextStyle(
                      fontFamily: "Ubuntu",
                    ),
                  ),
                  const MySizedBox(h: 0, w: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 121, 120, 120),
                    ),
                    height: 25,
                    width: 50,
                    child: const Center(
                      child: Text(
                        "- 1 +",
                        style: TextStyle(fontSize: 15, fontFamily: "Ubuntu"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CartCheckOutContainer extends StatelessWidget {
  const CartCheckOutContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 123, 123, 123),
              Color.fromARGB(255, 78, 78, 78)
            ]),
      ),
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Total Price",
              style: TextStyle(
                fontFamily: "Ubuntu",
                color: colorWhite,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const MySizedBox(h: 5, w: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "₹859,990",
                  style: TextStyle(
                    color: colorWhite,
                    fontFamily: "Ubuntu",
                    fontSize: 22,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: GestureDetector(
                    onTap: () {
                      gotoCheckOut(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 196, 196, 196),
                      ),
                      height: 30,
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "Checkout",
                              style:
                                  TextStyle(fontSize: 15, fontFamily: "Ubuntu"),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void gotoCheckOut(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return const ScreenCheckOut();
      },
    ),
  );
}

class CheckoutContainer extends StatelessWidget {
  const CheckoutContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: navBarColor, borderRadius: BorderRadius.circular(10)),
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
                children: [
                  const CircleAvatar(
                    radius: 10,
                    backgroundColor: Color.fromARGB(190, 96, 20, 158),
                  ),
                  const MySizedBox(h: 0, w: 5),
                  const Text(
                    "Color",
                    style: TextStyle(
                      fontFamily: "Ubuntu",
                    ),
                  ),
                  const MySizedBox(h: 0, w: 50),
                  const Text(
                    "₹85,999",
                    style: TextStyle(
                      fontFamily: "Ubuntu",
                    ),
                  ),
                  const MySizedBox(h: 0, w: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 121, 120, 120),
                    ),
                    height: 25,
                    width: 50,
                    child: const Center(
                      child: Text(
                        "1",
                        style: TextStyle(fontSize: 15, fontFamily: "Ubuntu"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

void gotoPaymentScreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return const ScreenPayment();
      },
    ),
  );
}
