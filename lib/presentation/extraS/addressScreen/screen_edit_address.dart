import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/color/colors.dart';
import '../../../core/widgets/focus_widgets.dart';
import '../LocationScreen/widgets/location_screen_widgets.dart';
import '../widgets/extra_screens_main_widgets.dart';

class ScreenEditAddress extends StatefulWidget {
  const ScreenEditAddress({super.key, required this.address});
  final ModelAddress address;
  @override
  State<ScreenEditAddress> createState() => _ScreenEditAddressState();
}

class _ScreenEditAddressState extends State<ScreenEditAddress> {
  @override
  void initState() {
    super.initState();
    addressTypeController =
        TextEditingController(text: widget.address.addressType);
    addressplaceController = TextEditingController(text: widget.address.place);
    sublocalityController =
        TextEditingController(text: widget.address.subLocality);
    pincodeCobntroller = TextEditingController(text: widget.address.pin);
    localityController = TextEditingController(text: widget.address.locality);
  }

  TextEditingController? addressTypeController;
  TextEditingController? addressplaceController;
  TextEditingController? sublocalityController;
  TextEditingController? pincodeCobntroller;
  TextEditingController? localityController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const AppbarPop(),
        title: AppBArTitle(
          title: 'Edit Location',
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
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
          ),
          Center(
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(105, 0, 0, 0),
                // border: Border.all(width: 2),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    20,
                  ),
                ),
              ),
              // height: 1000,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 13, right: 13),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ListView(
                    children: [
                      const MySizedBox(h: 10, w: 0),
                      TextFormField(
                        controller: addressTypeController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          hintText: "Address Type",
                          hintStyle: const TextStyle(
                            fontSize: 10,
                            fontFamily: myFont,
                          ),
                          fillColor: navBarColor,
                        ),
                      ),
                      const MySizedBox(h: 15, w: 0),
                      TextFormField(
                        controller: addressplaceController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          hintText: "Place",
                          hintStyle: const TextStyle(
                            fontSize: 10,
                            fontFamily: myFont,
                          ),
                          fillColor: navBarColor,
                        ),
                      ),
                      const MySizedBox(h: 15, w: 0),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: sublocalityController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          hintText: "SubLocality",
                          hintStyle: const TextStyle(
                            fontSize: 10,
                            fontFamily: myFont,
                          ),
                          fillColor: navBarColor,
                        ),
                      ),
                      const MySizedBox(h: 15, w: 0),
                      TextFormField(
                        controller: pincodeCobntroller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          hintText: "Pincode",
                          hintStyle: const TextStyle(
                            fontSize: 10,
                            fontFamily: myFont,
                          ),
                          fillColor: navBarColor,
                        ),
                      ),
                      const MySizedBox(h: 15, w: 0),
                      TextFormField(
                        controller: localityController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          hintText: "Locality",
                          hintStyle: const TextStyle(
                            fontSize: 10,
                            fontFamily: myFont,
                          ),
                          fillColor: navBarColor,
                        ),
                      ),
                      const MySizedBox(h: 15, w: 0),
                      ElevatedButton(
                        onPressed: () {
                          final addressType =
                              addressTypeController!.text.trim();
                          final place = addressplaceController!.text.trim();
                          final subLocality =
                              sublocalityController!.text.trim();
                          final pincode = pincodeCobntroller!.text.trim();
                          final locality = localityController!.text.trim();

                          addressData(
                            addressType: addressType,
                            locality: locality,
                            pin: pincode,
                            place: place,
                            sublocality: subLocality,
                            // name: name,
                            // addressName: addressName,
                            // phoneNo: phoneNo,
                            // pin: pincode,
                            // state: state,
                            // city: city,
                            // area: area,
                            // houseNo: houseNo,
                          );
                          const CircularProgressIndicator();

                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Center(
                                child: Text(
                                  "Address Added",
                                  style: TextStyle(
                                    fontFamily: myFont,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            navBarColor,
                          ),
                        ),
                        child: const Text(
                          "Add New Address",
                          style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 12,
                              color: colorBlack),
                        ),
                      ),
                      const MySizedBox(h: 10, w: 0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            navBarColor,
                          ),
                        ),
                        child: const Text(
                          "Close",
                          style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 12,
                              color: colorBlack),
                        ),
                      ),
                      const MySizedBox(h: 20, w: 0)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
