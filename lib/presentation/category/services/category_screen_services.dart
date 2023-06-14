import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../extraS/wishlistScreen/screen_wishlist.dart';

void gotoWishList(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return const ScreenWishlist();
      },
    ),
  );
}

Stream<List<Brands>> readBrand() => FirebaseFirestore.instance
    .collection("Brands")
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => Brands.fromJson(doc.data())).toList());

class Brands {
  String id;
  final String brandImage;
  final String brandName;

  Brands({
    this.id = "",
    required this.brandName,
    required this.brandImage,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "brand": brandName,
        "brandLogo": brandImage,
      };

  static Brands fromJson(Map<String, dynamic> json) => Brands(
        brandName: json["brand"],
        brandImage: json["brandLogo"],
        id: json["id"],
      );
}
