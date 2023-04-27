import 'package:flutter/material.dart';

import '../../../../core/color/colors.dart';
import '../../../../core/widgets/focus_widgets.dart';

class WishlistItemsGridView extends StatelessWidget {
  const WishlistItemsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        childAspectRatio: 1.0,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        return SizedBox(
          height: 240,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: navBarColor,
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                ),
                height: 115,
                width: MediaQuery.of(context).size.width / 2.15,
                child: Image.asset(
                  "assets/Vivo-X90-Pro__1_-removebg-preview.png",
                  // height: 100,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "₹ 14,999",
                    style: TextStyle(
                        fontFamily: "Ubuntu",
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  MySizedBox(h: 0, w: 24),
                  Icon(
                    Icons.favorite,
                    size: 20,
                  ),
                  Text(
                    " | ",
                    style: TextStyle(color: selectedItemsColor),
                  ),
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
        );
      },
      itemCount: 3,
    );
  }
}
