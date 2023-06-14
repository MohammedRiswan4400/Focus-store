import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../extraS/addressScreen/screen_address.dart';
import '../../extraS/profile/screen_profile.dart';

void gotoAddressScreen(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return const ScreenAddress();
      },
    ),
  );
}

void gotoProfileScreen(BuildContext context) async {
  final user = await fetchDataFromProfile();
  // ignore: use_build_context_synchronously
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return ScreenProfile(
          profile: user,
        );
      },
    ),
  );
}

Future<ModelProfile?> fetchDataFromProfile() async {
  final user = await FirebaseFirestore.instance
      .collection("user")
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection("profile")
      .doc("userProfile")
      .get();
  return ModelProfile.fromJson(user.data());
}

// void gotoPrivacyScreen(context) {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) {
//         return const ScreenAddress();
//       },
//     ),
//   );
// }
