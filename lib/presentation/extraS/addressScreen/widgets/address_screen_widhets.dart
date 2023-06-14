import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/color/colors.dart';
import '../../../../core/widgets/focus_widgets.dart';
import '../../LocationScreen/screen_location.dart';
import '../../LocationScreen/widgets/location_screen_widgets.dart';
import '../screen_edit_address.dart';

// ignore: must_be_immutable

// ignore: must_be_immutable
class AddressListTile extends StatelessWidget {
  String title;
  final ModelAddress addressDAta;
  final List<ModelAddress> addressListtwo;
  final Color iconColor;
  final Color circleColor;
  String subTitle;
  AddressListTile({
    required this.subTitle,
    required this.title,
    super.key,
    required this.addressDAta,
    required this.addressListtwo,
    required this.iconColor,
    required this.circleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
        height: 80,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: circleColor,
                    child: Icon(
                      Icons.location_pin,
                      color: iconColor,
                    ),
                  ),
                  const MySizedBox(h: 0, w: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontFamily: myFont, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        subTitle,
                        style:
                            const TextStyle(fontFamily: myFont, fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit_location_alt),
                    onPressed: () {
                      gotoEditAddressScreen(
                          context: context, address: addressDAta);
                    },
                  ),
                  // MySizedBox(h: 0, w: 10),
                  IconButton(
                    icon: const Icon(Icons.delete_rounded),
                    onPressed: () {
                      // Navigator.of(context).pop();
                      showDialog(
                        context: context,
                        // barrierDismissible: false,
                        builder: (context) {
                          return AlertDialog(
                            elevation: 2,
                            title: const Center(
                              child: Text(
                                "Do you want to delete",
                                style: TextStyle(
                                    fontFamily: "Ubuntu",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            content: Lottie.network(
                                "https://assets4.lottiefiles.com/private_files/lf30_ilvzxix1.json"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  "Close",
                                  style: TextStyle(
                                    fontFamily: myFont,
                                    fontWeight: FontWeight.bold,
                                    color: unselectedItemsColor,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  // ;
                                  final docAddress = FirebaseFirestore.instance
                                      .collection("user")
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.email)
                                      .collection("address")
                                      .doc(addressDAta
                                          .addressType); // .doc(cart.producName +
                                  //     cart.storage);

                                  docAddress.delete();
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Center(
                                        child: Text(
                                          "Address Deleted",
                                          style: TextStyle(
                                              fontFamily: myFont,
                                              fontWeight: FontWeight.bold),
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
                                },
                                child: const Text(
                                  "Delete",
                                  style: TextStyle(
                                    fontFamily: myFont,
                                    fontWeight: FontWeight.bold,
                                    color: unselectedItemsColor,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    // return ListTile(
    //   leading: const CircleAvatar(
    //     backgroundColor: unselectedItemsColor,
    //     child: Icon(
    //       Icons.location_pin,
    //       color: colorWhite,
    //     ),
    //   ),
    //   title: Text(
    //     title,
    //     style: const TextStyle(fontFamily: myFont, fontWeight: FontWeight.bold),
    //   ),
    //   subtitle: Text(
    //     subTitle,
    //     style: const TextStyle(fontFamily: myFont, fontSize: 11),
    //   ),
    //   trailing: Row(
    //     children: [
    //       CircleAvatar(
    //         radius: 6,
    //         backgroundColor: colorBlack,
    //       ),
    //       // Icon(Icons.edit_location_alt)
    //     ],
    //   ),
    // );
  }
}

class AddAddressContainer extends StatelessWidget {
  const AddAddressContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 123, 123, 123),
              Color.fromARGB(255, 78, 78, 78)
            ]),
      ),
      height: 70,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Add New Address",
            style: TextStyle(
              fontFamily: myFont,
              color: colorWhite,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}

void gotoShippingAddressDetails(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return ScreenLocation();
      },
    ),
  );
}

void gotoEditAddressScreen(
    {required BuildContext context, required ModelAddress address}) {
  // final ModelAddress address;
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) {
      return ScreenEditAddress(
        address: address,
      );
    },
  ));
}
