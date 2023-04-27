import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:focus_store/presentation/extraS/cart/widget/cart_widgets.dart';
import 'package:focus_store/presentation/extraS/widgets/extra_screens_main_widgets.dart';
import '../../../core/color/colors.dart';
import '../../../core/widgets/focus_widgets.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const AppbarPop(),
        title: AppBArTitle(
          title: 'Cart',
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
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: GestureDetector(
                    onLongPress: () {
                      showModalBottomSheet(
                        backgroundColor: colorTransperant,
                        barrierColor: modelSheetBarrierColor,
                        context: context,
                        builder: (context) {
                          return Container(
                            decoration: const BoxDecoration(
                              color: colorWhite,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            height: 270,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, left: 13, right: 13),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 94, 94, 94),
                                      borderRadius: BorderRadius.circular(310),
                                    ),
                                    height: 7,
                                    width: 30,
                                  ),
                                  const MySizedBox(h: 20, w: 0),
                                  const Text(
                                    "Remove from cart",
                                    style: TextStyle(
                                        fontFamily: "Ubuntu",
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const MySizedBox(h: 20, w: 0),
                                  const CartContainer(),
                                  const MySizedBox(h: 20, w: 0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            navBarColor,
                                          ),
                                        ),
                                        child: const Text(
                                          "Cancel",
                                          style: TextStyle(
                                              fontFamily: "Ubuntu",
                                              fontSize: 12,
                                              color: colorBlack),
                                        ),
                                      ),
                                      const MySizedBox(h: 0, w: 50),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: const Center(
                                                child: Text(
                                                  "Product Removed from cart",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  30,
                                                ),
                                              ),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              width: 250,
                                            ),
                                          );
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            navBarColor,
                                          ),
                                        ),
                                        child: const Text(
                                          "Yes",
                                          style: TextStyle(
                                            color: colorBlack,
                                            fontFamily: "Ubuntu",
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const CartContainer(),
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CartCheckOutContainer(),
          )
        ],
      ),
    );
  }
}
