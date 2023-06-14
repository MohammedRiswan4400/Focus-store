import 'dart:developer';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:focus_store/presentation/extraS/LocationScreen/widgets/location_screen_widgets.dart';
import 'package:focus_store/presentation/extraS/productScreen/screen_product.dart';
import 'package:focus_store/presentation/extraS/widgets/extra_screens_main_widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../../core/color/colors.dart';
import '../../../core/widgets/focus_widgets.dart';
import '../../navigaion/screen_navigation_page.dart';
import '../cart/screen_checkout.dart';

class ScreenPayment extends StatefulWidget {
  const ScreenPayment({
    super.key,
    required this.cartLisst,
    required this.totalAmount,
    required this.address,
  });
  final List<ModelCart> cartLisst;
  final int totalAmount;
  final ModelAddress address;

  @override
  State<ScreenPayment> createState() => _ScreenPaymentState();
}

class _ScreenPaymentState extends State<ScreenPayment> {
  // final address = Provider.of<AddressPicker>(context);
  Razorpay? _razorpay;

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // final cartList = widget.cartLisst;
    final fullAddress = widget.address;
    log("orderSuccessssssssssssssssssssssssssssssssss");
    for (var cartItem in widget.cartLisst) {
      await OrderModel.addOrder(
        cartItem: cartItem,
        address:
            "${fullAddress.addressType}\n${fullAddress.place}\n${fullAddress.pin}\n${fullAddress.subLocality}\n${fullAddress.locality}",
        email: FirebaseAuth.instance.currentUser!.email.toString(),
        id: "OrderId: ${DateTime.now().millisecondsSinceEpoch}",
        payment: 'RazorPay',
        price: widget.totalAmount,
      );
    }
    for (var cartItem in widget.cartLisst) {
      final docCart = FirebaseFirestore.instance
          .collection("user")
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection("cart")
          .doc(cartItem.producName + cartItem.storage);

      docCart.delete();
    }
    //  widget.ad

    showPAymentSuccess();
    // log("...................,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,...................,,,,,,");
  }

  Future<dynamic> showPAymentSuccess() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Lottie.network(
            "https://assets8.lottiefiles.com/packages/lf20_ty4pchuq.json",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  builder: (context) {
                    return ScreenNavigation();
                  },
                ), (route) => false);
              },
              child: const Text(
                "Go to Home",
                style: TextStyle(
                  fontFamily: myFont,
                  fontWeight: FontWeight.bold,
                  color: unselectedItemsColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log("Payment Failed: ${response.code} - ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("External wallet"),
      // backgroundColor: Kblue,
    ));
  }

  void makePayment() async {
    // var amount = widget.buynow ? buynowtotal : total ?? 0;
    // final int amount = totalAmount;

    var options = {
      'key': 'rzp_test_lYkNzoYOvoufeP',
      'amount': widget.totalAmount * 100,
      'name': "Focus Store",
      'description': 'Ordered items',
      'prefill': {'contact': '9946505254', 'email': 'focusstore@gmail.com'}
    };

    try {
      _razorpay?.open(options);
    } catch (e) {
      log(
        "error :::::$e",
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay?.clear();
    super.dispose();
  }

  SingingCharacter? _character = SingingCharacter.lafayette;
  // bool value = true;

  @override
  Widget build(BuildContext context) {
    // log(widget.totalAmount.toString());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const AppbarPop(),
        title: AppBArTitle(
          title: 'Payment Methods',
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
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Stack(
          children: [
            ListView(
              children: [
                const MySizedBox(h: 20, w: 0),
                const Center(
                  child: Text(
                    "Select the payment  method you want to use ",
                    style: TextStyle(
                      fontFamily: myFont,
                      fontSize: 14,
                    ),
                  ),
                ),
                const MySizedBox(h: 30, w: 0),
                Container(
                  decoration: BoxDecoration(
                      color: navBarColor,
                      borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  child: Center(
                    child: ListTile(
                      title: Row(
                        children: [
                          Image.asset(
                            "assets/payPal.png",
                            scale: 5,
                          ),
                          const MySizedBox(h: 0, w: 10),
                          const Text(
                            "RazorPay",
                            style: TextStyle(
                              fontFamily: myFont,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      leading: Radio<SingingCharacter>(
                        activeColor: unselectedItemsColor,
                        value: SingingCharacter.lafayette,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const MySizedBox(h: 20, w: 0),
                Container(
                  decoration: BoxDecoration(
                      color: navBarColor,
                      borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  child: Center(
                    child: ListTile(
                      title: Row(
                        children: [
                          Image.asset(
                            "assets/cashonDelivary.png",
                            scale: 5,
                          ),
                          const MySizedBox(h: 0, w: 10),
                          const Text(
                            "Cash on Delivary ",
                            style: TextStyle(
                              fontFamily: myFont,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      leading: Radio<SingingCharacter>(
                        activeColor: unselectedItemsColor,
                        value: SingingCharacter.jefferson,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: GestureDetector(
                onTap: () {
                  checkingPRessed();
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color.fromARGB(255, 123, 123, 123),
                        Color.fromARGB(255, 78, 78, 78)
                      ],
                    ),
                  ),
                  height: 70,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Confirm Payment",
                        style: TextStyle(
                          fontFamily: myFont,
                          color: colorWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void checkingPRessed() {
    final fullAddress = widget.address;
    if (_character == SingingCharacter.jefferson) {
      for (var cartItem in widget.cartLisst) {
        OrderModel.addOrder(
          cartItem: cartItem,
          address:
              "${fullAddress.addressType}\n${fullAddress.subLocality}\n${fullAddress.place}\n${fullAddress.pin}\n${fullAddress.locality}",
          email: FirebaseAuth.instance.currentUser!.email.toString(),
          id: "OrderId: ${DateTime.now().millisecondsSinceEpoch}",
          payment: 'Paid',
          price: widget.totalAmount,
        );
      }
      for (var cartItem in widget.cartLisst) {
        final docCart = FirebaseFirestore.instance
            .collection("user")
            .doc(FirebaseAuth.instance.currentUser!.email)
            .collection("cart")
            .doc(cartItem.producName + cartItem.storage);

        docCart.delete();
      }
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Lottie.network(
              "https://assets4.lottiefiles.com/packages/lf20_HmRWcatRRk.json",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                    builder: (context) {
                      return ScreenNavigation();
                    },
                  ), (route) => false);
                },
                child: const Text(
                  "Go to Home",
                  style: TextStyle(
                    fontFamily: myFont,
                    fontWeight: FontWeight.bold,
                    color: unselectedItemsColor,
                  ),
                ),
              ),
            ],
          );
        },
      );
    } else {
      makePayment();
    }
  }
}

class OrderModel {
  final String orderId;
  final String productColor;
  final String productName;
  final String image;
  final String storage;
  // final int qty;
  final int price;
  final int cartCount;
  final String payment;
  final String address;
  final String userEmail;
  final bool isCompleted;
  final int deliveryProcess;
  final bool isCancelled;
  OrderModel({
    required this.productColor,
    required this.orderId,
    required this.productName,
    required this.image,
    required this.storage,
    required this.price,
    required this.cartCount,
    required this.payment,
    required this.address,
    required this.userEmail,
    this.isCompleted = false,
    this.deliveryProcess = 0,
    this.isCancelled = false,
  });

  Map<String, dynamic> toJson() {
    return {
      "orderId": orderId,
      "productName": productName,
      "image": image,
      "storage": storage,
      "Price": price,
      "cartCount": cartCount,
      "payment": payment,
      "color": productColor,
      "address": address,
      "useEmail": userEmail,
      "isCAncelled": isCancelled,
      "isCompleted": isCompleted,
      "deliveryProcess": deliveryProcess,
    };
  }

  static Future<void> addOrder({
    required String email,
    required String id,
    // required String cartItems,
    required int price,
    required String payment,
    required String address,
    required ModelCart cartItem,
  }) async {
    final orderDoc = FirebaseFirestore.instance.collection("Orders").doc(id);

    final order = OrderModel(
      address: address,
      cartCount: cartItem.quantity,
      image: cartItem.productImage,
      orderId: id,
      payment: payment,
      price: price,
      productName: cartItem.producName,
      storage: cartItem.storage,
      userEmail: email,
      productColor: cartItem.colorName,
    );

    final json = order.toJson();
    await orderDoc.set(json);
  }

  static OrderModel fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json["orderId"],
      productName: json["productName"],
      image: json["image"],
      storage: json["storage"],
// qty : json["qty"],
      price: json["Price"],
      cartCount: json["cartCount"],
      payment: json["payment"],
      address: json["address"],
      userEmail: json["useEmail"],
      isCancelled: json["isCAncelled"],
      deliveryProcess: json["deliveryProcess"],
      isCompleted: json["isCompleted"], productColor: json["color"],
    );
  }

  Stream<List<OrderModel>> getAllOrders() {
    return FirebaseFirestore.instance.collection("Orders").snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => OrderModel.fromJson(doc.data()))
            .toList());
  }

  static Future<void> updateOrderStatus(
      {required OrderModel orderModel, required int newProcess}) async {
    final orderDoc =
        FirebaseFirestore.instance.collection("Orders").doc(orderModel.orderId);

    final newOrder = OrderModel(
      orderId: orderModel.orderId,
      productName: orderModel.productName,
      image: orderModel.image,
      storage: orderModel.storage,
      price: orderModel.price,
      cartCount: orderModel.cartCount,
      payment: orderModel.payment,
      address: orderModel.address,
      userEmail: orderModel.userEmail,
      isCancelled: orderModel.isCancelled,
      deliveryProcess: newProcess,
      isCompleted: (newProcess <= 3) ? false : true,
      productColor: orderModel.productColor,
    );

    final json = newOrder.toJson();
    await orderDoc.update(json);
  }

  static Future<void> cancelOrder({required OrderModel orderModel}) async {
    final orderDoc =
        FirebaseFirestore.instance.collection("Orders").doc(orderModel.orderId);

    final newOrder = OrderModel(
        orderId: orderModel.orderId,
        productName: orderModel.productName,
        image: orderModel.image,
        storage: orderModel.storage,
        price: orderModel.price,
        cartCount: orderModel.cartCount,
        payment: orderModel.payment,
        address: orderModel.address,
        userEmail: orderModel.userEmail,
        isCancelled: true,
        deliveryProcess: orderModel.deliveryProcess,
        isCompleted: orderModel.isCompleted,
        productColor: orderModel.productColor);
    final json = newOrder.toJson();
    await orderDoc.update(json);
  }
}
