import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:focus_store/core/widgets/focus_widgets.dart';
import 'package:focus_store/presentation/extraS/profile/widget/profile_screen_widgets.dart';
import 'package:focus_store/presentation/extraS/widgets/extra_screens_main_widgets.dart';

import '../../../core/color/colors.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        leading: const AppbarPop(),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: AppBArTitle(title: "Edit Profile"),
        backgroundColor: Colors.white.withAlpha(200),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        shadowColor: colorTransperant,
        toolbarHeight: 60,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 35,
          right: 35,
          top: 10,
        ),
        child: ListView(
          children: [
            const MySizedBox(h: 30, w: 0),
            ProfileWithoutTextField(
              hintText: 'Name',
            ),
            ProfileWithoutTextField(
              hintText: 'Nick Name',
            ),
            ProfileWithTextField(
              hintText: "DOB",
              icon: const Icon(Icons.calendar_month_rounded),
              onTap: () {},
              keyboardType: TextInputType.none,
            ),
            ProfileWithTextField(
              hintText: "Email",
              icon: const Icon(Icons.email_rounded),
              keyboardType: TextInputType.emailAddress,
              onTap: () {},
            ),
            ProfileWithTextField(
              hintText: "Phone",
              icon: const Icon(Icons.phone_android_rounded),
              keyboardType: TextInputType.phone,
              onTap: () {},
            ),
            ProfileWithTextField(
              hintText: "Sex",
              icon: const Icon(Icons.arrow_drop_down_rounded),
              keyboardType: TextInputType.none,
              onTap: () {},
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  navBarColor,
                ),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(
                  fontFamily: "Ubuntu",
                  color: unselectedItemsColor,
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
