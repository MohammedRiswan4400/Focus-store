// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:focus_store/presentation/extraS/cart/screen_cart.dart';
import '../../../core/color/colors.dart';
import '../../../core/widgets/focus_widgets.dart';
import '../services/category_screen_services.dart';

class CartWishlistContainer extends StatelessWidget {
  String title;

  CartWishlistContainer({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: splahBlue,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: navBarColor, width: 4),
      ),
      height: 60,
      width: MediaQuery.of(context).size.width / 2.15,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              fontFamily: "Ubuntu", fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}

void gotoCart(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return const ScreenCart();
      },
    ),
  );
}

class CategoryFirstWidget extends StatelessWidget {
  const CategoryFirstWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              gotoCart(context);
            },
            child: CartWishlistContainer(
              title: "Cart",
            ),
          ),
          const MySizedBox(h: 0, w: 9),
          GestureDetector(
            onTap: () {
              gotoWishList(context);
            },
            child: CartWishlistContainer(
              title: "Wishlist",
            ),
          )
        ],
      ),
    );
  }
}

class CategorySecondWidget extends StatelessWidget {
  const CategorySecondWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: navBarColor,
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              height: 300,
              width: MediaQuery.of(context).size.width / 1.51,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 5, right: 5, top: 7, bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "April Sale",
                      style: TextStyle(
                          fontFamily: "Ubuntu",
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7, bottom: 3),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        height: 124,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          child: Image.asset(
                            "assets/1676961035959.jpg.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      // height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        child: Image.asset(
                          "assets/1676960983311.jpg.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const MySizedBox(h: 5, w: 0),
            Container(
              decoration: BoxDecoration(
                color: navBarColor,
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              height: 179,
              width: MediaQuery.of(context).size.width / 1.51,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 5),
                child: Column(
                  children: [
                    const Text(
                      "Audio",
                      style: TextStyle(
                          fontFamily: "Ubuntu",
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    const MySizedBox(h: 2, w: 0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amber),
                          // height: 144,
                          width: 134,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            child: Image.asset(
                              "assets/oppoencoX.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 7),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 120,
                                width: 90,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    10,
                                  ),
                                  child: Image.asset(
                                    "assets/oneplusbuds.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const Row(
                              children: [
                                Text(
                                  "See All",
                                  style: TextStyle(
                                      fontFamily: "Ubuntu",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11),
                                ),
                                MySizedBox(h: 0, w: 5),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 12,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: colorBlack,
            border: Border.all(
              color: navBarColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          // height: 485,
          width: 100,
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 8, left: 4, right: 4),
              child: Column(
                children: [
                  const MySizedBox(h: 10, w: 0),
                  const Text(
                    "Choose Your",
                    style: TextStyle(
                      fontFamily: "Ubuntu",
                      color: colorWhite,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    "Brand",
                    style: TextStyle(
                      color: colorWhite,
                      fontFamily: "Ubuntu",
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const MyDivider(),
                  StreamBuilder(
                    stream: readBrand(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text(
                            "Somthing went wrong!",
                          ),
                        );
                      } else if (snapshot.hasData) {
                        final brands = snapshot.data!;
                        return Column(
                          children: brands.map(buildBrand).toList(),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryThirdWidget extends StatelessWidget {
  const CategoryThirdWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: navBarColor,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      height: 200,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Smart Watch",
              style: TextStyle(
                fontFamily: "Ubuntu",
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Container(
              color: colorBlack,
              height: 159,
              width: double.infinity,
              child: Image.asset(
                "assets/sec-bg7-ba4cfab3dc73c03a3d8b6b702697c9c8.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildBrand(Brands brands) => Padding(
      padding: const EdgeInsets.only(
        bottom: 5,
      ),
      child: CircleAvatar(
        radius: 27,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: Image.network(
          brands.brandImage,
          fit: BoxFit.fill,
          scale: 3,
        ),
      ),
    );
