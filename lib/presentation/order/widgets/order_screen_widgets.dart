import 'package:flutter/material.dart';
import 'package:focus_store/presentation/extraS/payment/screen_payment.dart';

import '../../../core/color/colors.dart';
import '../../../core/widgets/focus_widgets.dart';
import '../../extraS/trackOrder/screen_track_order.dart';

class OrderTitle extends StatelessWidget {
  const OrderTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Order",
      style: TextStyle(
        fontFamily: "Ubuntu",
        color: colorBlack,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}

class ActiveOrderContainer extends StatelessWidget {
  const ActiveOrderContainer({
    super.key,
    required this.orderList,
  });
  final OrderModel orderList;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 108,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 20,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              height: 79,
              width: 71,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  orderList.image,
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
                orderList.productName,
                style: const TextStyle(fontFamily: "Ubuntu", fontSize: 15),
              ),
              const MySizedBox(h: 5, w: 0),
              Text(
                " ${orderList.storage}",
                style: const TextStyle(fontFamily: "Ubuntu", fontSize: 12),
              ),
              const MySizedBox(h: 5, w: 0),
              Row(
                children: [
                  Text(
                    "Qty: ${orderList.cartCount}",
                    style: const TextStyle(
                      fontFamily: "Ubuntu",
                    ),
                  ),
                  const MySizedBox(h: 0, w: 10),
                  Text(
                    "₹ ${orderList.price}",
                    style: const TextStyle(
                      fontFamily: "Ubuntu",
                    ),
                  ),
                  // const MySizedBox(h: 0, w: 10),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    gotoTrackOrder(
                      context: context,
                      order: orderList,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 121, 120, 120),
                    ),
                    height: 25,
                    width: 80,
                    child: const Center(
                      child: Text(
                        "Track Order",
                        style: TextStyle(fontSize: 10, fontFamily: "Ubuntu"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CompletedOrderContainer extends StatelessWidget {
  const CompletedOrderContainer({super.key, required this.orderCompleted});

  final OrderModel orderCompleted;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: colorWhite),
      // height: 250,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 12, 69, 80),
                  radius: 13,
                  child: Image.asset(
                    "assets/box-removebg-preview.png",
                    scale: 10,
                  ),
                ),
                const MySizedBox(h: 0, w: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Deliverd",
                      style: TextStyle(
                        fontFamily: myFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                    const MySizedBox(h: 5, w: 0),
                    Text(
                      orderCompleted.orderId,
                      style: const TextStyle(
                        fontFamily: myFont,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const MySizedBox(h: 20, w: 0),
            Container(
              decoration: const BoxDecoration(
                color: navBarColor,
              ),
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          // color: Colors.amber,
                          ),
                      height: 80,
                      width: 70,
                      child: Image.network(
                        orderCompleted.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const MySizedBox(h: 0, w: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          orderCompleted.productName,
                          style:
                              const TextStyle(fontFamily: myFont, fontSize: 13),
                        ),
                        Text(
                          "Color: ${orderCompleted.productColor}",
                          style:
                              const TextStyle(fontFamily: myFont, fontSize: 13),
                        ),
                        Row(
                          children: [
                            Text(
                              "Qty :${orderCompleted.cartCount}",
                              style: const TextStyle(
                                  fontFamily: myFont, fontSize: 13),
                            ),
                            const MySizedBox(h: 0, w: 20),
                            Text(
                              "₹ ${orderCompleted.price}",
                              style: const TextStyle(
                                  fontFamily: myFont, fontSize: 13),
                            ),
                            const MySizedBox(h: 0, w: 20),
                            const Text(
                              "completed",
                              style:
                                  TextStyle(fontFamily: myFont, fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const MySizedBox(h: 20, w: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Bought this for",
                  style: TextStyle(fontFamily: myFont, fontSize: 12),
                ),
                Text(
                  orderCompleted.userEmail,
                  style: const TextStyle(fontFamily: myFont, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StarWidget extends StatelessWidget {
  const StarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.star),
        MySizedBox(h: 0, w: 5),
        Icon(Icons.star),
        MySizedBox(h: 0, w: 5),
        Icon(Icons.star),
        MySizedBox(h: 0, w: 5),
        Icon(Icons.star_border),
        MySizedBox(h: 0, w: 5),
        Icon(Icons.star_border),
      ],
    );
  }
}

void gotoTrackOrder(
    {required BuildContext context, required OrderModel order}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return ScreenTrackOrder(
          order: order,
        );
      },
    ),
  );
}
