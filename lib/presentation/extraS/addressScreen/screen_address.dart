// import 'dart:developer';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:focus_store/core/widgets/focus_widgets.dart';
import 'package:focus_store/presentation/extraS/addressScreen/widgets/address_screen_widhets.dart';
import 'package:provider/provider.dart';
import '../../../application/address_controller/address_provider.dart';
import '../../../core/color/colors.dart';
import '../LocationScreen/widgets/location_screen_widgets.dart';
import '../widgets/extra_screens_main_widgets.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class ScreenAddress extends StatefulWidget {
  // final String value;
  const ScreenAddress({
    super.key,
  });

  @override
  State<ScreenAddress> createState() => _ScreenAddressState();
}

class _ScreenAddressState extends State<ScreenAddress> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    // final widget = ModalRoute.of(context)?.settings.arguments;
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
            StreamBuilder(
              stream: fetchDAtaFromAddress(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final addressList = snapshot.data;
                  if (addressList!.isEmpty) {
                    return const Center(
                      child: Text("Add Address"),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: addressList.length,
                      itemBuilder: (context, index) {
                        final address = addressList[index];

                        return InkWell(
                          onTap: () {
                            // Navigator.pop(context);
                            // setState(() {
                            //   selectedIndex = index;
                            // });
                            // Navigator.of(context).pop("screenAddress");
                            Provider.of<AddressPicker>(context, listen: false)
                                .selectedAddress(
                              address,
                            );
                            Navigator.of(context).pop();

                            // Navigator.pushNamed(
                            //   context,
                            //   // secondScreenRoute,
                            //   arguments: 'This is the text',
                            // );
                          },
                          child: AddressListTile(
                            subTitle: address.locality,
                            title: address.addressType,
                            addressDAta: addressList[index],
                            addressListtwo: const [],
                            iconColor:
                                selectedIndex == index ? mainBlue : colorWhite,
                            circleColor: selectedIndex == index
                                ? colorBlack
                                : unselectedItemsColor,
                          ),
                        );
                      },
                    );
                  }
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
            // ListView.builder(
            //   itemCount: 4,
            //   itemBuilder: (context, index) {
            //     return AddressListTile(
            //       subTitle: "subTitle",
            //       title: "title",
            //     );
            //   },
            // ),
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

Stream<List<ModelAddress>> fetchDAtaFromAddress() => FirebaseFirestore.instance
    .collection("user")
    .doc(FirebaseAuth.instance.currentUser!.email)
    .collection("address")
    .snapshots()
    .map(
      (snapshot) => snapshot.docs
          .map(
            (doc) => ModelAddress.fromJson(
              doc.data(),
            ),
          )
          .toList(),
    );
