import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../core/color/colors.dart';
import '../../../core/widgets/focus_widgets.dart';

class NewArrivalPhones extends StatelessWidget {
  const NewArrivalPhones({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // decoration: const BoxDecoration(color: Colors.amber),
      // height: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              log("message");
            },
            child: Container(
              decoration: BoxDecoration(
                color: navBarColor,
                borderRadius: BorderRadius.circular(
                  5,
                ),
              ),
              height: 110,
              width: MediaQuery.of(context).size.width / 2.15,
              child: Image.asset(
                "assets/pms_1677427639.01867146!256x256.png",
              ),
            ),
          ),
          const MySizedBox(h: 3, w: 0),
          const Text(
            "Vivo Y22 (Blue)",
            style: TextStyle(
                fontFamily: "Ubuntu",
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          const Text(
            "4 GB ram,64 GB rom",
            style: TextStyle(
                fontFamily: "Ubuntu",
                fontSize: 11,
                fontWeight: FontWeight.w500),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "₹ 14,999",
                style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              // MySizedBox(h: 0, w: 24),
              // Icon(
              //   Icons.favorite_border_outlined,
              //   size: 20,
              // ),
              // Text(
              //   " | ",
              //   style: TextStyle(color: selectedItemsColor),
              // ),
              Row(
                children: [
                  Text(
                    "4.5",
                    style: TextStyle(fontSize: 15),
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
