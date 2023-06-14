import 'package:flutter/material.dart';
import 'package:focus_store/presentation/home/widget/home_widgets.dart';

import '../../extraS/productScreen/screen_product.dart';
import '../../extraS/searchScreen/screen_search.dart';

void gotoSearchScreen(BuildContext context) async {
  final List<Product> productList = await readProducts().first;
  // ignore: use_build_context_synchronously
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return ScreenSearch(
          products: productList,
        );
      },
    ),
  );
}

void gotoProductScreen(
    {required BuildContext context, required Product product}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return ScreenProduct(
          product: product,
        );
      },
    ),
  );
}

class Product {
  String id;
  final String producName;
  final String brandName;
  final String colorName;
  final String quantity;
  final String price;
  final String offerPrice;
  final String description;
  final List<dynamic> productImage;
  final String storage;

  Product({
    this.id = "",
    required this.brandName,
    required this.colorName,
    required this.description,
    required this.offerPrice,
    required this.price,
    required this.producName,
    required this.productImage,
    required this.quantity,
    required this.storage,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "producName": producName,
        "brandName": brandName,
        "colorName": colorName,
        "quantity": quantity,
        "price": price,
        "offerPrice": offerPrice,
        "description": description,
        "productImage": productImage,
        "storage": storage
      };

  static Product fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        storage: json["storage"],
        brandName: json["brandName"],
        colorName: json["colorName"],
        description: json["description"],
        offerPrice: json["offerPrice"],
        price: json["price"],
        producName: json["producName"],
        productImage: json["productImage"],
        quantity: json["quantity"],
      );
}
