import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:focus_store/core/widgets/focus_widgets.dart';
import 'package:focus_store/presentation/account/widget/account_screen_widgets.dart';
import '../../core/color/colors.dart';

class ScreenAccount extends StatelessWidget {
  const ScreenAccount({super.key});

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
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: colorBlack,
                  radius: 40,
                  child: Image.asset(
                    "assets/Screenshot_2023-04-03_123417-removebg-preview.png",
                    scale: 3,
                  ),
                ),
                Positioned(
                  left: 60,
                  bottom: 1,
                  right: 1,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: navBarColor,
                            border: Border.all(
                              color: unselectedItemsColor,
                              width: 2,
                            )),
                        height: 25,
                        width: 25,
                        child: const Icon(
                          Icons.edit,
                          size: 15,
                          color: colorBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const MySizedBox(h: 10, w: 0),
            Column(
              children: const [
                Text(
                  "Moahmmed Riswan MT",
                  style: TextStyle(
                      fontFamily: "Ubuntu",
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                MySizedBox(h: 5, w: 0),
                Text(
                  "riswanmt4400@gmail.com",
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontSize: 12,
                  ),
                ),
                MySizedBox(h: 5, w: 0),
              ],
            ),
            const MyDivider(),
            const MySizedBox(h: 10, w: 0),
            ProfileListTile(
              title: 'Edit Profile',
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
              title: "Privacy Policy",
              trailingIcon: Icons.arrow_forward_ios_rounded,
              leadingIcon: Icons.warning,
              onTap: () {},
            ),
            ProfileListTile(
              title: "Invite Friends",
              trailingIcon: Icons.arrow_forward_ios_rounded,
              leadingIcon: Icons.supervisor_account_rounded,
              onTap: () {},
            ),
            const LogOutTile(),
            const MySizedBox(h: 40, w: 0),
            Column(
              children: [
                const Text(
                  "Connect with Us",
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const MySizedBox(h: 10, w: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
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
