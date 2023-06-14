import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:focus_store/presentation/extraS/LocationScreen/widgets/location_screen_widgets.dart';
import 'package:focus_store/presentation/extraS/payment/screen_payment.dart';
import 'package:provider/provider.dart';
import '../../../../application/address_controller/address_provider.dart';
import '../../../../core/color/colors.dart';
import '../../../../core/widgets/focus_widgets.dart';
import '../../productScreen/screen_product.dart';
import '../screen_checkout.dart';

class CartContainer extends StatelessWidget {
  final ModelCart cartProducts;
  final List<ModelCart>? cartList;
  // final int totalAmount;

  const CartContainer({
    super.key,
    // required this.totalAmount,
    required this.cartList,
    required this.cartProducts,
  });

  @override
  Widget build(BuildContext context) {
    return
        // ListView.builder(
        //   physics: const BouncingScrollPhysics(),
        //   itemCount: cartList?.length,
        //   itemBuilder: (context, index) {
        // final cartProducts = cartList![index];
        //     return
        Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
            color: navBarColor, borderRadius: BorderRadius.circular(10)),
        height: 108,
        width: double.infinity,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 79,
                width: 71,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    cartProducts.productImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: SizedBox(
                // color: Colors.amber,
                width: 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          cartProducts.producName,
                          style: const TextStyle(
                              fontFamily: "Ubuntu", fontSize: 15),
                        ),
                        const MySizedBox(h: 0, w: 10),
                      ],
                    ),
                    Text(
                      // ignore: unnecessary_string_interpolations
                      "${cartProducts.storage}",
                      style:
                          const TextStyle(fontFamily: "Ubuntu", fontSize: 12),
                    ),
                    Text(
                      "Color: ${cartProducts.colorName}",
                      style: const TextStyle(
                        fontFamily: "Ubuntu",
                      ),
                    ),
                    Text(
                      // "₹ ${cartProducts.price + (cartProducts.price * cartProducts.quantity)}",
                      "₹ ${cartProducts.price * cartProducts.quantity}",
                      // "₹ ${(int.parse(cartProducts.price) * cartProducts.quantity!)}",
                      style: const TextStyle(
                        fontFamily: "Ubuntu",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20),
            //     color: const Color.fromARGB(255, 121, 120, 120),
            //   ),
            //   height: 75,
            //   width: 40,
            //   child:
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (cartProducts.quantity > 1) {
                        final docCartProduct = FirebaseFirestore.instance
                            .collection("user")
                            .doc(FirebaseAuth.instance.currentUser!.email)
                            .collection("cart")
                            .doc(
                                cartProducts.producName + cartProducts.storage);

                        docCartProduct
                            .update({"quantity": cartProducts.quantity - 1});
                      } else if (cartProducts.quantity == 1) {
                        showModalBottomSheet(
                          backgroundColor: colorTransperant,
                          barrierColor: modelSheetBarrierColor,
                          context: context,
                          builder: (context) {
                            return Container(
                              decoration: const BoxDecoration(
                                color: colorWhite,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              height: 180,
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8, left: 13, right: 13),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 94, 94, 94),
                                        borderRadius:
                                            BorderRadius.circular(310),
                                      ),
                                      height: 7,
                                      width: 30,
                                    ),
                                    const MySizedBox(h: 20, w: 0),
                                    const Text(
                                      "Product remove from cart",
                                      style: TextStyle(
                                          fontFamily: "Ubuntu",
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const MySizedBox(h: 20, w: 0),
                                    // CartContainer(cartList: ),
                                    const MySizedBox(h: 20, w: 0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
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
                                            final docCart = FirebaseFirestore
                                                .instance
                                                .collection("user")
                                                .doc(FirebaseAuth.instance
                                                    .currentUser!.email)
                                                .collection("cart")
                                                .doc(cartProducts.producName +
                                                    cartProducts.storage);

                                            docCart.delete();
                                            // },

                                            Navigator.of(context).pop();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: const Center(
                                                  child: Text(
                                                    "Product Removed from cart",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    30,
                                                  ),
                                                ),
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                width: 250,
                                              ),
                                            );
                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
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
                            );
                          },
                        );
                      }
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10)),
                        color: Color.fromARGB(255, 121, 120, 120),
                      ),
                      width: 40,
                      height: 26,
                      child: const Center(
                        child: Text(
                          "-",
                          style: TextStyle(fontSize: 20, fontFamily: "Ubuntu"),
                        ),
                      ),
                    ),
                  ),
                  const MySizedBox(h: 2, w: 0),
                  Container(
                    decoration: const BoxDecoration(
                      // borderRadius:
                      //     BorderRadius.vertical(bottom: Radius.circular(10)),
                      color: Color.fromARGB(255, 121, 120, 120),
                    ),
                    width: 40,
                    height: 30,
                    child: Center(
                      child: Text(
                        //
                        cartProducts.quantity.toString(),
                        // ignore: prefer_const_constructors
                        style: TextStyle(fontSize: 15, fontFamily: "Ubuntu"),
                      ),
                    ),
                  ),
                  const MySizedBox(h: 2, w: 0),
                  GestureDetector(
                    onTap: () {
                      final docCartProduct = FirebaseFirestore.instance
                          .collection("user")
                          .doc(FirebaseAuth.instance.currentUser!.email)
                          .collection("cart")
                          .doc(cartProducts.producName + cartProducts.storage);

                      docCartProduct
                          .update({"quantity": cartProducts.quantity + 1});
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(10)),
                        color: Color.fromARGB(255, 121, 120, 120),
                      ),
                      width: 40,
                      height: 26,
                      child: const Center(
                        child: Text(
                          "+",
                          style: TextStyle(fontSize: 20, fontFamily: "Ubuntu"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // ),
            // MySizedBox(h: 0, w: 20),
            // IconButton(
            //     onPressed: () {
            //       final docCart = FirebaseFirestore.instance
            //           .collection("user")
            //           .doc(FirebaseAuth.instance.currentUser!.email)
            //           .collection("cart")
            //           .doc(cartProducts.id);
            //     },
            //     icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
    // },
    // );
  }
}

// ignore: must_be_immutable
class CartCheckOutContainer extends StatelessWidget {
  // final int totalAmount;
  // final ModelCart cartProducts;
  const CartCheckOutContainer({
    super.key,
    // required this.cartProducts,
    // required this.totalAmount,
  });
  // ModelCart? cart;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 123, 123, 123),
              Color.fromARGB(255, 78, 78, 78)
            ]),
      ),
      height: 80,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Total Price",
              style: TextStyle(
                fontFamily: "Ubuntu",
                color: colorWhite,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const MySizedBox(h: 5, w: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StreamBuilder(
                    stream: fetchDataFromCart(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else if (snapshot.hasData) {
                        final cartList = snapshot.data;
                        if (cartList == null) {
                          return const CircularProgressIndicator();
                        } else {
                          int totalAmount = 0;
                          for (var item in cartList) {
                            totalAmount += item.price * item.quantity;
                          }
                          return Text(
                            "₹ $totalAmount",

                            // "₹ ${cartProducts.price * cartProducts.quantity}",
                            style: const TextStyle(
                              color: colorWhite,
                              fontFamily: "Ubuntu",
                              fontSize: 22,
                            ),
                          );
                        }
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      gotoCheckOut(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 196, 196, 196),
                      ),
                      height: 30,
                      width: 120,
                      child: const Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Checkout",
                              style:
                                  TextStyle(fontSize: 15, fontFamily: "Ubuntu"),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void gotoCheckOut(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return const ScreenCheckOut();
      },
    ),
  );
}

class CheckoutContainer extends StatelessWidget {
  final ModelCart cart;
  final List<ModelCart>? cartList;
  const CheckoutContainer({
    super.key,
    required this.cart,
    this.cartList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: navBarColor, borderRadius: BorderRadius.circular(10)),
          height: 108,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 79,
                      width: 71,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          cart.productImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cart.producName,
                        style: const TextStyle(
                          fontFamily: "Ubuntu",
                          fontSize: 15,
                        ),
                      ),
                      const MySizedBox(h: 5, w: 0),
                      Text(
                        cart.storage,
                        style: const TextStyle(
                          fontFamily: "Ubuntu",
                          fontSize: 12,
                        ),
                      ),
                      const MySizedBox(h: 5, w: 0),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text("Color :"),
                              const MySizedBox(h: 0, w: 5),
                              Text(
                                cart.colorName,
                                style: const TextStyle(
                                  fontFamily: "Ubuntu",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              // const MySizedBox(h: 0, w: 30),
              Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "₹ ${cart.price * cart.quantity}",
                          style: const TextStyle(
                            fontFamily: "Ubuntu",
                          ),
                        ),
                        const MySizedBox(h: 0, w: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 121, 120, 120),
                          ),
                          height: 25,
                          width: 50,
                          child: Center(
                            child: Text(
                              cart.quantity.toString(),
                              style: const TextStyle(
                                  fontSize: 15, fontFamily: "Ubuntu"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

void gotoPaymentScreen(
    {required BuildContext context,
    required List<ModelCart> modelCartList,

    // required List<ModelAddress address,
    required int totalAmount}) {
  final address = Provider.of<AddressPicker>(context, listen: false);
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return ScreenPayment(
          address: address.address!,
          cartLisst: modelCartList,
          totalAmount: totalAmount,
          // addressList: address,
        );
      },
    ),
  );
}

Stream<List<ModelAddress>> getAddressStream(String user) {
  return FirebaseFirestore.instance
      .collection("user")
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection('address')
      .snapshots()
      .map(
        (snapshot) => snapshot.docs
            .map((doc) => ModelAddress.fromJson(doc.data()))
            .toList(),
      );
}
