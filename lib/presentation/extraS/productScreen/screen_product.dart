import 'dart:developer';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:focus_store/core/widgets/focus_widgets.dart';
import 'package:focus_store/presentation/extraS/productScreen/widgets/product_screen_widget.dart';
import 'package:focus_store/presentation/extraS/widgets/extra_screens_main_widgets.dart';
import '../../../core/color/colors.dart';
import '../../home/screen_home.dart';
import '../../home/services/home_screen_services.dart';

List imageProductList = [
  {
    "id": 1,
    "image_path": "assets/ff548482dab68707347f8861fa0bf387.png",
  },
  {
    "id": 2,
    "image_path": "assets/thumb_703910_default_big-removebg-preview.png",
  },
  {
    "id": 3,
    "image_path": "assets/Vivo-X90-Pro__1_-removebg-preview.png",
  },
];

// final String label = "";

class ScreenProduct extends StatefulWidget {
  const ScreenProduct({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ScreenProduct> createState() => _ScreenProductState();
}

class _ScreenProductState extends State<ScreenProduct> {
//   @override
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    final List<dynamic> images = widget.product.productImage;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const AppbarPop(),
        elevation: 0,
        backgroundColor: appBarBackground,
        shadowColor: colorTransperant,
        toolbarHeight: 40,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: appBarContainerColor),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Stack(
          children: [
            ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: navBarColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      height: 330,
                      child: CarouselSlider(
                        items: images
                            .map(
                              (item) => ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(item)
                                  // Image.asset(
                                  //   item["image_path"],
                                  //   fit: BoxFit.fill,
                                  // ),
                                  ),
                            )
                            .toList(),
                        carouselController: carouselController,
                        options: CarouselOptions(
                          scrollPhysics: const BouncingScrollPhysics(),
                          aspectRatio: 1.5,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imageProductList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () =>
                                carouselController.animateToPage(entry.key),
                            child: Container(
                              width: 6,
                              height: 6,
                              margin: const EdgeInsets.symmetric(horizontal: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: currentIndex == entry.key
                                    ? unselectedItemsColor
                                    : selectedItemsColor,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        StreamBuilder(
                          stream: fetchDataFromWishlist(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                            } else if (snapshot.hasData) {
                              final wishlist = snapshot.data;
                              if (wishlist == null) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else {
                                return IconButton(
                                  onPressed: () async {
                                    wishlist
                                            .where(
                                              (element) =>
                                                  element.producName +
                                                      element.storage ==
                                                  widget.product.producName +
                                                      widget.product.storage,
                                            )
                                            .isEmpty
                                        ? await addProductToWishlist(
                                            context: context,
                                            product: widget.product)
                                        : await deleteDataFromWishlist(
                                            context: context,
                                            product: widget.product);
                                  },
                                  icon: wishlist
                                          .where(
                                            (element) =>
                                                element.producName +
                                                    element.storage ==
                                                widget.product.producName +
                                                    widget.product.storage,
                                          )
                                          .isEmpty
                                      ? const Icon(
                                          Icons.favorite_border_rounded,
                                          color: colorBlack,
                                        )
                                      : const Icon(
                                          Icons.favorite,
                                          color: colorBlack,
                                        ),
                                );
                              }
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const MySizedBox(h: 10, w: 0),
                Text(
                  widget.product.brandName,
                  style: const TextStyle(
                      fontFamily: "Ubuntu",
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
                const MySizedBox(h: 5, w: 0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.producName,
                      style: const TextStyle(
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product.storage,
                          style: const TextStyle(
                              fontFamily: "Ubuntu",
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                        const Row(
                          children: [
                            Text(
                              "4.5",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Ubuntu"),
                            ),
                            MySizedBox(
                              h: 0,
                              w: 4,
                            ),
                            Icon(
                              Icons.star,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "₹ ${widget.product.offerPrice}",
                      style: const TextStyle(
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₹ ${widget.product.price}",
                          style: const TextStyle(
                              fontFamily: "Ubuntu",
                              color: selectedItemsColor,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 15),
                        ),
                        const Text(
                          "2k reviews",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Ubuntu",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const MySizedBox(h: 2, w: 0),
                const MyDivider(),
                const MySizedBox(h: 2, w: 0),
                const Text(
                  "Color",
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                const MySizedBox(h: 5, w: 0),
                const ColorRow(),
                const MySizedBox(h: 10, w: 0),
                const Text(
                  "Description",
                  style: TextStyle(
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                const MySizedBox(h: 5, w: 0),
                Text(
                  widget.product.description,
                  style: const TextStyle(
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                const MySizedBox(h: 2, w: 0),
                const MySizedBox(
                  h: 60,
                  w: 0,
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: backgroundScaffoldColor,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Column(
                    children: [
                      // const MySizedBox(h: 2, w: 0),
                      const MyDivider(),
                      GestureDetector(
                        onTap: () async {
                          // log("aaaaaaaaaa");
                          // gotoCart(context);
                          // if (label == 'Add to Cart') {
                          // log("aaaaaaaaaa");
                          try {
                            await addToCart(
                              productName: widget.product.producName,
                              colorName: widget.product.colorName,
                              offerPrice: widget.product.offerPrice,
                              productImage: widget.product.productImage[0],
                              // qty: 1,
                              storage: widget.product.storage,
                            );
                            // Fluttertoast.showToast(
                            //   msg: "Succesfully added to the cart",
                            //   toastLength: Toast.LENGTH_SHORT,
                            //   gravity: ToastGravity.BOTTOM,
                            //   timeInSecForIosWeb: 1,
                            //   fontSize: 18.0,
                            // );
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Center(
                                  child: Text(
                                    "Succesfully added to the Cart",
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
                                // width: 10,
                              ),
                            );
                            // log("message");
                          } catch (e) {
                            log(e.toString());
                          }
                          // }
                        },
                        child: const AddToCartRow(),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future addToCart({
  required String productName,
  required String colorName,
  required String offerPrice,
  required String storage,
  // required int qty,
  required String productImage,
}) async {
  final docCart = FirebaseFirestore.instance
      .collection("user")
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection("cart")
      .doc(productName + storage);

  final cart = ModelCart(
    id: docCart.id,
    colorName: colorName,
    price: int.parse(offerPrice),
    producName: productName,
    productImage: productImage,
    quantity: 1,
    storage: storage,
  );

  final cartjsonformat = cart.toJson();
  await docCart.set(cartjsonformat);
}

class ModelCart {
  String id;
  final String producName;
  final String colorName;
  final int price;
  final String storage;
  final String productImage;
  final int quantity;

  ModelCart({
    this.id = "",
    required this.producName,
    required this.colorName,
    required this.productImage,
    required this.price,
    required this.quantity,
    required this.storage,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "producName": producName,
        "colorName": colorName,
        "quantity": quantity,
        "price": price,
        "productImage": productImage,
        "storage": storage,
      };

  static ModelCart fromJson(Map<String, dynamic> json) => ModelCart(
        producName: json["producName"],
        colorName: json["colorName"],
        productImage: json["productImage"],
        price: json["price"],
        quantity: json["quantity"],
        storage: json["storage"],
      );
}

Stream<List<ModelCart>> fetchDataFromCart() => FirebaseFirestore.instance
    .collection("user")
    .doc(FirebaseAuth.instance.currentUser!.email)
    .collection("cart")
    .snapshots()
    .map(
      (snapshot) => snapshot.docs
          .map(
            (doc) => ModelCart.fromJson(
              doc.data(),
            ),
          )
          .toList(),
    );

// Future<ModelCart> fetchAmountFromCart(
//     {required Product product, required BuildContext context}) {
//    FirebaseFirestore.instance
//       .collection("user")
//       .doc(FirebaseAuth.instance.currentUser!.email)
//       .collection("cart")
//       .snapshots()
//       .map(
//         (snapshot) => snapshot.docs
//             .map(
//               (doc) => ModelCart.fromJson(
//                 doc.data(),
//               ),
//             )
//             .toList(),
//       );
// }
// Future<ModelCart?>  fetchAmountFromCart() async {
//   final amaount = await FirebaseFirestore.instance
//       .collection("user")
//       .doc(FirebaseAuth.instance.currentUser!.email)
//       .collection("profile")
//       .doc("userProfile")
//       .get();
//   return ModelCart.fromJson(amaount.data());
// }

Future addProductToWishlist(
    {required Product product, required BuildContext context}) async {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Center(
        child: Text(
          "Added to wishlist",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          30,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      width: 250,
    ),
  );
  final docCart = FirebaseFirestore.instance
      .collection("user")
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection("Wishlist")
      .doc(product.producName + product.storage);

  final productjsonformat = product.toJson();
  await docCart.set(productjsonformat);
}

Stream<List<Product>> fetchDataFromWishlist() => FirebaseFirestore.instance
    .collection("user")
    .doc(FirebaseAuth.instance.currentUser!.email)
    .collection("Wishlist")
    .snapshots()
    .map(
      (snapshot) => snapshot.docs
          .map(
            (doc) => Product.fromJson(
              doc.data(),
            ),
          )
          .toList(),
    );

Future<void> deleteDataFromWishlist(
    {required Product product, required BuildContext context}) async {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Center(
        child: Text(
          "Removed from wishlist",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          30,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      width: 250,
    ),
  );
  final docCart = FirebaseFirestore.instance
      .collection("user")
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection("Wishlist")
      .doc(product.producName + product.storage);

  await docCart.delete();
}
