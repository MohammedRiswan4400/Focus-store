import 'package:flutter/material.dart';

import '../../../core/color/colors.dart';
import '../../../core/widgets/focus_widgets.dart';
import '../../extraS/productScreen/screen_product.dart';
import '../../extraS/searchScreen/screen_search.dart';

class AppbarSearchHome extends StatelessWidget {
  const AppbarSearchHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.none,
      onTap: () {
        gotoSearchScreen(context);
      },
      decoration: InputDecoration(
        hintText: "iPhone,Samsung,oppo....",
        // prefixIcon: const Icon(Icons.search_rounded),
        hintStyle: const TextStyle(
          fontFamily: "Ubuntu",
          color: hintTextColor,
          fontSize: 14,
        ),
        filled: true,
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        fillColor: navBarColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    );
  }
}

class NewArrivalPhones extends StatelessWidget {
  const NewArrivalPhones({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // decoration: const BoxDecoration(color: Colors.amber),
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
              "assets/pms_1677427639.01867146!256x256.png",
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
                Icons.favorite_border_outlined,
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
  }
}

void gotoSearchScreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return const ScreenSearch();
      },
    ),
  );
}

void gotoProductScreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return const ScreenProduct();
      },
    ),
  );
}
