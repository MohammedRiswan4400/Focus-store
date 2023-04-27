import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:focus_store/core/widgets/focus_widgets.dart';
import 'package:focus_store/presentation/account/widget/account_screen_widgets.dart';
import 'package:focus_store/presentation/extraS/cart/widget/cart_widgets.dart';

import '../../../core/color/colors.dart';
import '../addressScreen/widgets/address_screen_widhets.dart';
import '../widgets/extra_screens_main_widgets.dart';

class ScreenCheckOut extends StatelessWidget {
  const ScreenCheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const AppbarPop(),
        title: AppBArTitle(
          title: 'Checkout',
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
            child: ListView(
              children: [
                const Text(
                  "Shipping Address",
                  style: TextStyle(
                    fontFamily: myFont,
                    fontSize: 15,
                  ),
                ),
                AddressListTile(
                  title: 'Home',
                  subTitle: '636704,ThiruvegappuraPO,Kollam',
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      gotoAddressScreen(context);
                    },
                    child: const Text(
                      "Change Address",
                      style: TextStyle(
                        fontFamily: myFont,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                const MyDivider(),
                const Text(
                  "Order List",
                  style: TextStyle(
                    fontFamily: myFont,
                    fontSize: 15,
                  ),
                ),
                const MySizedBox(h: 20, w: 0),
                const CheckoutContainer(),
                const MySizedBox(h: 20, w: 0),
                const MyDivider(),
                const MySizedBox(h: 20, w: 0),
                const Text(
                  "Promo Code",
                  style: TextStyle(
                    fontFamily: myFont,
                    fontSize: 15,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PromocodeTextfiels(
                      hintText: "Promo code",
                      onTap: () {},
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: navBarColor,
                          borderRadius: BorderRadius.circular(10)),
                      height: 45,
                      width: 60,
                      child: Center(
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: navBarColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 180,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(29.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Amount",
                              style: TextStyle(
                                fontFamily: myFont,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "₹ 85,999",
                              style: TextStyle(
                                fontFamily: myFont,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const MySizedBox(h: 10, w: 0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Quantity",
                              style: TextStyle(
                                fontFamily: myFont,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "1",
                              style: TextStyle(
                                fontFamily: myFont,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const MySizedBox(h: 10, w: 0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Shipping Charge",
                              style: TextStyle(
                                fontFamily: myFont,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "₹ 50",
                              style: TextStyle(
                                fontFamily: myFont,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const MySizedBox(h: 10, w: 0),
                        const Divider(
                          color: unselectedItemsColor,
                        ),
                        const MySizedBox(h: 10, w: 0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Total",
                              style: TextStyle(
                                fontFamily: myFont,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "₹ 86,049",
                              style: TextStyle(
                                fontFamily: myFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
                onTap: () {
                  gotoPaymentScreen(context);
                },
                child: const CheckOutContainer()),
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class PromocodeTextfiels extends StatelessWidget {
  String hintText;
  void Function() onTap;
  PromocodeTextfiels({
    required this.hintText,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(height: 45, width: 270),
        child: GestureDetector(
          onTap: onTap,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              // prefixIcon: const Icon(Icons.search_rounded),
              hintStyle: const TextStyle(
                fontFamily: "Ubuntu",
                color: hintTextColor,
                fontSize: 14,
              ),
              filled: true,
              fillColor: navBarColor,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
            ),
          ),
        ),
      ),
    );
  }
}

class CheckOutContainer extends StatelessWidget {
  const CheckOutContainer({
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
      child: const Center(
        child: Text(
          "Continue Payment",
          style: TextStyle(
            fontFamily: "Ubuntu",
            color: colorWhite,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
