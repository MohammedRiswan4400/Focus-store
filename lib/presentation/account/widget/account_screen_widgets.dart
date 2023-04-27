import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:focus_store/core/widgets/focus_widgets.dart';
import 'package:focus_store/presentation/extraS/addressScreen/screen_address.dart';

import '../../../core/color/colors.dart';
import '../../extraS/profile/screen_profile.dart';

class AccountTitle extends StatelessWidget {
  const AccountTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Account",
      style: TextStyle(
        fontFamily: "Ubuntu",
        color: colorBlack,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}

// ignore: must_be_immutable
class ProfileListTile extends StatelessWidget {
  String title;
  IconData leadingIcon;
  IconData trailingIcon;
  void Function() onTap;
  ProfileListTile({
    required this.title,
    required this.trailingIcon,
    required this.leadingIcon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          leadingIcon,
          size: 25,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: "Ubuntu",
            fontSize: 15,
          ),
        ),
        trailing: Icon(
          trailingIcon,
          size: 20,
        ),
      ),
    );
  }
}

class LogOutTile extends StatelessWidget {
  const LogOutTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          barrierColor: modelSheetBarrierColor,
          backgroundColor: colorTransperant,
          context: context,
          builder: (context) => Container(
            decoration: const BoxDecoration(
              color: colorWhite,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                  20,
                ),
              ),
            ),
            height: 202,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 94, 94, 94),
                      borderRadius: BorderRadius.circular(310),
                    ),
                    height: 7,
                    width: 30,
                  ),
                  const MySizedBox(h: 20, w: 0),
                  const Text(
                    "Logout",
                    style: TextStyle(
                        fontFamily: "Ubuntu",
                        fontSize: 14,
                        color: colorRed,
                        fontWeight: FontWeight.bold),
                  ),
                  const MySizedBox(h: 40, w: 0),
                  const Text(
                    "Are you sure you want to Logout",
                    style: TextStyle(
                        fontFamily: "Ubuntu",
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const MySizedBox(h: 30, w: 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                          FirebaseAuth.instance.signOut();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
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
          ),
        );
      },
      child: const ListTile(
        leading: Icon(
          Icons.logout,
          color: colorRed,
        ),
        title: Text(
          "Logout",
          style: TextStyle(
            fontFamily: "Ubuntu",
            color: colorRed,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

void gotoProfileScreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return const ScreenProfile();
      },
    ),
  );
}

void gotoAddressScreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return const ScreenAddress();
      },
    ),
  );
}
