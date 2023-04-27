import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:focus_store/core/widgets/focus_widgets.dart';
import 'package:focus_store/presentation/extraS/addressScreen/widgets/address_screen_widhets.dart';
import 'package:lottie/lottie.dart';
import '../../../core/color/colors.dart';
import '../widgets/extra_screens_main_widgets.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class ScreenAddress extends StatelessWidget {
  const ScreenAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const AppbarPop(),
        title: AppBArTitle(
          title: 'Shipping Address',
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
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Stack(
          children: [
            ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onLongPress: () {
                    showModalBottomSheet(
                      backgroundColor: colorTransperant,
                      barrierColor: modelSheetBarrierColor,
                      context: context,
                      builder: (context) {
                        return Container(
                          decoration: const BoxDecoration(
                            color: colorWhite,
                            // border: Border.all(width: 2),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(
                                20,
                              ),
                            ),
                          ),
                          height: 200,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, left: 13, right: 13),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                  "Shipping Address",
                                  style: TextStyle(
                                      fontFamily: "Ubuntu",
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                const MySizedBox(h: 20, w: 0),
                                const Text(
                                  "Do you want to Edit/Delete this Address",
                                  style: TextStyle(
                                    fontFamily: "Ubuntu",
                                    fontSize: 10,
                                  ),
                                ),
                                const MySizedBox(h: 20, w: 0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              elevation: 2,
                                              content: SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    2,
                                                child: ListView(
                                                  children: [
                                                    const Text(
                                                      "Edit Address",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: myFont,
                                                      ),
                                                    ),
                                                    const MySizedBox(
                                                        h: 15, w: 0),
                                                    EditAddressAlertDailoge(
                                                      hintText:
                                                          "Full Name(required)*",
                                                    ),
                                                    const MySizedBox(
                                                        h: 15, w: 0),
                                                    EditAddressAlertDailoge(
                                                      hintText:
                                                          "Address Name(required)*",
                                                    ),
                                                    const MySizedBox(
                                                        h: 15, w: 0),
                                                    EditAddressAlertDailoge(
                                                      hintText:
                                                          "Phone Number(required)*",
                                                    ),
                                                    const MySizedBox(
                                                        h: 15, w: 0),
                                                    EditAddressAlertDailoge(
                                                      hintText:
                                                          "Pincode(required)*",
                                                    ),
                                                    const MySizedBox(
                                                        h: 15, w: 0),
                                                    EditAddressAlertDailoge(
                                                      hintText:
                                                          "City(required)*",
                                                    ),
                                                    const MySizedBox(
                                                        h: 15, w: 0),
                                                    EditAddressAlertDailoge(
                                                      hintText:
                                                          "State(required)*",
                                                    ),
                                                    const MySizedBox(
                                                        h: 15, w: 0),
                                                    EditAddressAlertDailoge(
                                                      hintText:
                                                          "Road Name,Area,Colony(required)*",
                                                    ),
                                                    const MySizedBox(
                                                        h: 15, w: 0),
                                                    EditAddressAlertDailoge(
                                                      hintText:
                                                          "House No,Building Name(required)*",
                                                    ),
                                                    const MySizedBox(
                                                        h: 15, w: 0),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content:
                                                                const Center(
                                                              child: Text(
                                                                "Address Edited",
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      myFont,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                30,
                                                              ),
                                                            ),
                                                            behavior:
                                                                SnackBarBehavior
                                                                    .floating,
                                                            width: 180,
                                                          ),
                                                        );
                                                      },
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(
                                                          navBarColor,
                                                        ),
                                                      ),
                                                      child: const Text(
                                                        "Add Edited Address",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Ubuntu",
                                                            fontSize: 12,
                                                            color: colorBlack),
                                                      ),
                                                    ),
                                                    const MySizedBox(
                                                        h: 10, w: 0),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(
                                                          navBarColor,
                                                        ),
                                                      ),
                                                      child: const Text(
                                                        "Close",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Ubuntu",
                                                            fontSize: 12,
                                                            color: colorBlack),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          navBarColor,
                                        ),
                                      ),
                                      child: const Text(
                                        "Edit",
                                        style: TextStyle(
                                            fontFamily: "Ubuntu",
                                            fontSize: 12,
                                            color: colorBlack),
                                      ),
                                    ),
                                    const MySizedBox(h: 0, w: 30),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        showDialog(
                                          context: context,
                                          // barrierDismissible: false,
                                          builder: (context) {
                                            return AlertDialog(
                                              elevation: 2,
                                              content: Lottie.network(
                                                  "https://assets6.lottiefiles.com/packages/lf20_pyxc5ttd.json"),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text(
                                                    "Close",
                                                    style: TextStyle(
                                                      fontFamily: myFont,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          unselectedItemsColor,
                                                    ),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: const Center(
                                                          child: Text(
                                                            "Address Deleted",
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    myFont,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            30,
                                                          ),
                                                        ),
                                                        behavior:
                                                            SnackBarBehavior
                                                                .floating,
                                                        width: 180,
                                                      ),
                                                    );
                                                  },
                                                  child: const Text(
                                                    "Delete",
                                                    style: TextStyle(
                                                      fontFamily: myFont,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          unselectedItemsColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          navBarColor,
                                        ),
                                      ),
                                      child: const Text(
                                        "Delete",
                                        style: TextStyle(
                                            fontFamily: "Ubuntu",
                                            fontSize: 12,
                                            color: colorBlack),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: AddressListTile(
                    subTitle: "subTitle",
                    title: "title",
                  ),
                );
              },
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: GestureDetector(
                  onTap: () {
                    gotoShippingAddressDetails(context);
                  },
                  child: const AddAddressContainer()),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class EditAddressAlertDailoge extends StatelessWidget {
  String hintText;
  EditAddressAlertDailoge({
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(
        height: 40,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 10,
            fontFamily: myFont,
          ),
          fillColor: navBarColor,
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context) {
  String contentText = "";
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(
        child: Text(
          contentText,
          style:
              const TextStyle(fontFamily: myFont, fontWeight: FontWeight.bold),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          30,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      width: 180,
    ),
  );
}
