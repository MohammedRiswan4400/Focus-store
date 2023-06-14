import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:focus_store/presentation/extraS/LocationScreen/widgets/location_screen_widgets.dart';
import '../../../../core/color/colors.dart';
import '../../../core/widgets/focus_widgets.dart';
import '../widgets/extra_screens_main_widgets.dart';

class ScreenLocation extends StatelessWidget {
  ScreenLocation({super.key});

  final addressTypeController = TextEditingController();
  final addressPlaceController = TextEditingController();
  final addressSublocalityController = TextEditingController();
  final addressPincodeCobntroller = TextEditingController();
  final addressLocalityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const AppbarPop(),
        title: AppBArTitle(
          title: 'Location',
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
                          hintText: "Address Type eg.(Home,Office...)",
                          hintStyle: const TextStyle(
                            fontSize: 10,
                            fontFamily: myFont,
                          ),
                          fillColor: navBarColor,
                        ),
                      ),
                      const MySizedBox(h: 15, w: 0),
                      TextFormField(
                        controller: addressPlaceController,
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
                        controller: addressSublocalityController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          hintText: "Sublocality",
                          hintStyle: const TextStyle(
                            fontSize: 10,
                            fontFamily: myFont,
                          ),
                          fillColor: navBarColor,
                        ),
                      ),
                      const MySizedBox(h: 15, w: 0),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: addressLocalityController,
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
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: addressPincodeCobntroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          hintText: "Pin code",
                          hintStyle: const TextStyle(
                            fontSize: 10,
                            fontFamily: myFont,
                          ),
                          fillColor: navBarColor,
                        ),
                      ),
                      const MySizedBox(h: 15, w: 0),
                      // TextFormField(
                      //   controller: addressAreaNameController,
                      //   decoration: InputDecoration(
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     filled: true,
                      //     hintText: "Road Name,Area,Colony(required)*",
                      //     hintStyle: const TextStyle(
                      //       fontSize: 10,
                      //       fontFamily: myFont,
                      //     ),
                      //     fillColor: navBarColor,
                      //   ),
                      // ),
                      // const MySizedBox(h: 15, w: 0),
                      // TextFormField(
                      //   controller: addressHouseNumberController,
                      //   decoration: InputDecoration(
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     filled: true,
                      //     hintText: "House No,Building Name(required)*",
                      //     hintStyle: const TextStyle(
                      //       fontSize: 10,
                      //       fontFamily: myFont,
                      //     ),
                      //     fillColor: navBarColor,
                      //   ),
                      // ),
                      // const MySizedBox(h: 15, w: 0),
                      // TextFormField(
                      //   controller: addressStateNameController,
                      //   decoration: InputDecoration(
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide.none,
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //     filled: true,
                      //     hintText: "Starte(required)*",
                      //     hintStyle: const TextStyle(
                      //       fontSize: 10,
                      //       fontFamily: myFont,
                      //     ),
                      //     fillColor: navBarColor,
                      //   ),
                      // ),
                      const MySizedBox(h: 15, w: 0),
                      ElevatedButton(
                        onPressed: () {
                          final addressType = addressTypeController.text.trim();
                          final place = addressPlaceController.text.trim();
                          final sublocality =
                              addressSublocalityController.text.trim();
                          final locality =
                              addressPincodeCobntroller.text.trim();
                          final pincode = addressLocalityController.text.trim();

                          addressData(
                            pin: pincode,
                            place: place,
                            sublocality: sublocality,
                            addressType: addressType,
                            locality: locality,
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
