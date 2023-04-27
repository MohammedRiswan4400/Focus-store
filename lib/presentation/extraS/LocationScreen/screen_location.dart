import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../core/color/colors.dart';
import '../../../core/widgets/focus_widgets.dart';
import '../addressScreen/screen_address.dart';
import '../widgets/extra_screens_main_widgets.dart';

class ScreenLocation extends StatelessWidget {
  const ScreenLocation({super.key});

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
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Image.asset(
              "assets/location.png",
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                elevation: 2,
                content: SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: ListView(
                    children: [
                      const Text(
                        "Add Address",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: myFont,
                        ),
                      ),
                      const MySizedBox(h: 15, w: 0),
                      EditAddressAlertDailoge(
                        hintText: "Full Name(required)*",
                      ),
                      const MySizedBox(h: 15, w: 0),
                      EditAddressAlertDailoge(
                        hintText: "Address Name(required)*",
                      ),
                      const MySizedBox(h: 15, w: 0),
                      EditAddressAlertDailoge(
                        hintText: "Phone Number(required)*",
                      ),
                      const MySizedBox(h: 15, w: 0),
                      EditAddressAlertDailoge(
                        hintText: "Pincode(required)*",
                      ),
                      const MySizedBox(h: 15, w: 0),
                      EditAddressAlertDailoge(
                        hintText: "City(required)*",
                      ),
                      const MySizedBox(h: 15, w: 0),
                      EditAddressAlertDailoge(
                        hintText: "State(required)*",
                      ),
                      const MySizedBox(h: 15, w: 0),
                      EditAddressAlertDailoge(
                        hintText: "Road Name,Area,Colony(required)*",
                      ),
                      const MySizedBox(h: 15, w: 0),
                      EditAddressAlertDailoge(
                        hintText: "House No,Building Name(required)*",
                      ),
                      const MySizedBox(h: 15, w: 0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Center(
                                child: Text(
                                  "Address Added",
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
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(
          Icons.add_location_alt_rounded,
          color: colorBlack,
        ),
      ),
    );
  }
}
