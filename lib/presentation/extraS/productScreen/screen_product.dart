import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:focus_store/core/widgets/focus_widgets.dart';
import 'package:focus_store/presentation/category/widget/category_screen_widgets.dart';
import 'package:focus_store/presentation/extraS/productScreen/widgets/product_screen_widget.dart';
import 'package:focus_store/presentation/extraS/widgets/extra_screens_main_widgets.dart';
import '../../../core/color/colors.dart';
import '../../home/screen_home.dart';

List imageProductList = [
  {
    "id": 1,
    "image_path": "assets/ff548482dab68707347f8861fa0bf387.png",
  },
  {
    "id": 2,
    "image_path": "assets/thumb_703910_default_big-removebg-preview.png",
  },
  {
    "id": 3,
    "image_path": "assets/Vivo-X90-Pro__1_-removebg-preview.png",
  },
];

class ScreenProduct extends StatefulWidget {
  const ScreenProduct({super.key});

  @override
  State<ScreenProduct> createState() => _ScreenProductState();
}

class _ScreenProductState extends State<ScreenProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const AppbarPop(),
        elevation: 0,
        backgroundColor: appBarBackground,
        shadowColor: colorTransperant,
        toolbarHeight: 40,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: appBarContainerColor),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: navBarColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  height: 330,
                  child: CarouselSlider(
                    items: imageProductList
                        .map(
                          (item) => ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              item["image_path"],
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                        .toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                      scrollPhysics: const BouncingScrollPhysics(),
                      aspectRatio: 1.5,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imageProductList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () =>
                            carouselController.animateToPage(entry.key),
                        child: Container(
                          width: 6,
                          height: 6,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: currentIndex == entry.key
                                ? unselectedItemsColor
                                : selectedItemsColor,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border_rounded,
                        color: colorBlack,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const MySizedBox(h: 10, w: 0),
            const PriceColumnWidget(),
            const MySizedBox(h: 2, w: 0),
            const MyDivider(),
            const MySizedBox(h: 2, w: 0),
            const Text(
              "Color",
              style: TextStyle(
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            const MySizedBox(h: 5, w: 0),
            const ColorRow(),
            const MySizedBox(h: 10, w: 0),
            const Text(
              "Description",
              style: TextStyle(
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            const MySizedBox(h: 5, w: 0),
            const DescriptionWidget(),
            const MySizedBox(h: 2, w: 0),
            const MyDivider(),
            const MySizedBox(h: 2, w: 0),
            GestureDetector(
                onTap: () {
                  gotoCart(context);
                },
                child: const AddToCartRow()),
            const MySizedBox(
              h: 15,
              w: 0,
            ),
          ],
        ),
      ),
    );
  }
}
