import 'package:flutter/material.dart';

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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: colorWhite, borderRadius: BorderRadius.circular(10)),
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
                  const MySizedBox(h: 0, w: 30),
                  const Text(
                    "₹85,999",
                    style: TextStyle(
                      fontFamily: "Ubuntu",
                    ),
                  ),
                  const MySizedBox(h: 0, w: 10),
                  GestureDetector(
                    onTap: () {
                      gotoTrackOrder(context);
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
            ],
          )
        ],
      ),
    );
  }
}

class CompletedOrderContainer extends StatelessWidget {
  const CompletedOrderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: colorWhite),
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  children: const [
                    Text(
                      "Deliverd",
                      style: TextStyle(
                        fontFamily: myFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                    MySizedBox(h: 5, w: 0),
                    Text(
                      "on Wednesday,27 April 2023",
                      style: TextStyle(
                        fontFamily: myFont,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
                        color: Colors.amber,
                      ),
                      height: 80,
                      width: 70,
                      child: Image.asset(
                        "assets/iphoneatcart.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    const MySizedBox(h: 0, w: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "iPhone 14 Pro (256 gb)",
                          style: TextStyle(fontFamily: myFont, fontSize: 13),
                        ),
                        Row(
                          children: const [
                            CircleAvatar(
                              radius: 10,
                              backgroundColor:
                                  Color.fromARGB(255, 134, 40, 188),
                            ),
                            MySizedBox(h: 0, w: 5),
                            Text(
                              "Color",
                              style:
                                  TextStyle(fontFamily: myFont, fontSize: 13),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Text(
                              "Qty :1",
                              style:
                                  TextStyle(fontFamily: myFont, fontSize: 13),
                            ),
                            MySizedBox(h: 0, w: 20),
                            Text(
                              "₹ 85,999",
                              style:
                                  TextStyle(fontFamily: myFont, fontSize: 13),
                            ),
                            MySizedBox(h: 0, w: 20),
                            Text(
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
            Container(
              height: 40,
              color: navBarColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Please give your rating",
                      style: TextStyle(fontFamily: myFont, fontSize: 12),
                    ),
                    StarWidget(),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Bought this for",
                  style: TextStyle(fontFamily: myFont, fontSize: 12),
                ),
                Text(
                  "Mohammed Riswan MT",
                  style: TextStyle(fontFamily: myFont, fontSize: 12),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
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

void gotoTrackOrder(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return const ScreenTrackOrder();
      },
    ),
  );
}
