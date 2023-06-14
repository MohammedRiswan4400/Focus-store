import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:focus_store/core/widgets/focus_widgets.dart';
import 'package:focus_store/presentation/account/services/account_screen_services.dart';
import 'package:focus_store/presentation/account/widget/account_screen_widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import '../../core/color/colors.dart';
import '../extraS/profile/screen_profile.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:http/http.dart' as http;

// var profileAdding = null;

class ScreenAccount extends StatelessWidget {
  // final ModelProfile modelProfile;
  const ScreenAccount({
    super.key,
    // required this.modelProfile,
    // required this.profile,
  });
  // Future<void> _launchUrl({required Uri url}) async {
  //   if (!await launchUrl(url)) {
  //     throw Exception('Could not launch $url');
  //   }
  // }
  // final ModelProfile profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const AccountTitle(),
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
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 10,
        ),
        child: ListView(
          children: [
            FutureBuilder<ModelProfile?>(
              future: fetchDataFromProfile(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text("Error Loading"));
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  final userData = snapshot.data;
                  // buildUserDetails();
                  if (userData == null) {
                    return const SizedBox();
                  } else {
                    return buildUserDetails(userData);
                  }
                } else {
                  return const Center(
                    child: SizedBox(),
                  );
                }
              },
            ),
            const MySizedBox(h: 10, w: 0),
            ProfileListTile(
              title: 'Profile',
              leadingIcon: Icons.account_circle_rounded,
              trailingIcon: Icons.arrow_forward_ios_rounded,
              onTap: () {
                gotoProfileScreen(context);
              },
            ),
            ProfileListTile(
              title: "Address",
              trailingIcon: Icons.arrow_forward_ios_rounded,
              leadingIcon: Icons.location_on_sharp,
              onTap: () {
                gotoAddressScreen(context);
              },
            ),
            ProfileListTile(
              title: "Invite Friends",
              trailingIcon: Icons.arrow_forward_ios_rounded,
              leadingIcon: Icons.supervisor_account_rounded,
              onTap: () async {
                Share.share(
                  'Download Focus Store from Playstore For Free \nDownload Now On Playstore',
                );
              },
            ),
            ProfileListTile(
                title: "About Us",
                trailingIcon: Icons.arrow_forward_ios_rounded,
                leadingIcon: Icons.business_center_rounded,
                onTap: () {
                  // gotPrivacy(context);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actions: [
                          Lottie.network(
                              "https://assets6.lottiefiles.com/packages/lf20_w51pcehl.json")
                        ],
                        content: const Text(
                          "This App is designed and developed \nby Mohammed Riswan MT",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            // color: colorWhite,
                          ),
                        ),
                      );
                    },
                  );
                }),
            ProfileListTile(
                title: "License",
                trailingIcon: Icons.arrow_forward_ios_rounded,
                leadingIcon: Icons.contact_page_rounded,
                onTap: () {
                  // gotPrivacy(context);
                  // showAboutDialog(context: context);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const LicensePage();
                    },
                  ));
                }),
            const LogOutTile(),
            const MySizedBox(h: 40, w: 0),
            const Column(
              children: [
                Text(
                  "Connect with Us",
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                MySizedBox(h: 10, w: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.facebook,
                      color: unselectedItemsColor,
                    ),
                    MySizedBox(h: 0, w: 5),
                    Icon(
                      Icons.facebook,
                      color: unselectedItemsColor,
                    ),
                    MySizedBox(h: 0, w: 5),
                    Icon(
                      Icons.facebook,
                      color: unselectedItemsColor,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
