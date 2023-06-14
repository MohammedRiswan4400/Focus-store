import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:focus_store/application/address_controller/address_provider.dart';
import 'package:focus_store/core/widgets/focus_widgets.dart';
import 'package:focus_store/presentation/extraS/cart/widget/cart_widgets.dart';
import 'package:focus_store/presentation/extraS/productScreen/screen_product.dart';
import 'package:provider/provider.dart';
import '../../../core/color/colors.dart';
import '../addressScreen/screen_address.dart';
import '../widgets/extra_screens_main_widgets.dart';

class ScreenCheckOut extends StatefulWidget {
  const ScreenCheckOut({super.key});

  @override
  State<ScreenCheckOut> createState() => _ScreenCheckOutState();
}

class _ScreenCheckOutState extends State<ScreenCheckOut> {
  // AddressController controller = Get.put(AddressController());

  // String value = "data";
  @override
  Widget build(BuildContext context) {
    final address = Provider.of<AddressPicker>(context, listen: false).address;
    // final SecondScreenState secondScreenState = secondScreenKey.currentState;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const AppbarPop(),
        title: AppBArTitle(
          title: 'Checkout',
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
      body: StreamBuilder(
        stream: fetchDataFromCart(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.hasData) {
            final cartList = snapshot.data;
            if (cartList == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              int totalAmount = 0;
              for (var item in cartList) {
                totalAmount += item.price * item.quantity;
              }
              // ignore: unused_local_variable
              for (var item in cartList) {}
              return Stack(
                children: [
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 8),
                      child: ListView(
                        physics: const ScrollPhysics(),
                        children: [
                          const Center(
                            child: Text(
                              "Address",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () async {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const ScreenAddress();
                                    },
                                  ),
                                );
                              },
                              child: Consumer<AddressPicker>(
                                  builder: (context, addressPicker, _) {
                                final address = addressPicker.address;
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40, right: 40),
                                  child: Container(
                                    // width: ,
                                    decoration: BoxDecoration(
                                        color: navBarColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Center(
                                        child: Text(
                                          address == null
                                              ? "Click here"
                                              : address.addressType,
                                          style: const TextStyle(
                                            fontFamily: myFont,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          // Text(
                          //  selectu ,
                          //   style: TextStyle(color: colorRed),
                          // ),
                          const SizedBox(
                            height: 20,
                          ),
                          const MyDivider(),
                          const Text(
                            "Order List",
                            style: TextStyle(
                              fontFamily: myFont,
                              fontSize: 15,
                            ),
                          ),
                          const MySizedBox(h: 20, w: 0),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: cartList.length,
                            itemBuilder: (context, index) {
                              final cart = cartList[index];
                              return CheckoutContainer(
                                cart: ModelCart(
                                    producName: cart.producName,
                                    colorName: cart.colorName,
                                    productImage: cart.productImage,
                                    price: cart.price,
                                    quantity: cart.quantity,
                                    storage: cart.storage),
                              );
                            },
                          ),
                          const MySizedBox(h: 20, w: 0),
                          const MyDivider(),
                          const MySizedBox(h: 20, w: 0),

                          Container(
                            decoration: BoxDecoration(
                              color: navBarColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // height: 200,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(29.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Amount",
                                        style: TextStyle(
                                          fontFamily: myFont,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text("₹ $totalAmount"),
                                    ],
                                  ),
                                  const MySizedBox(h: 10, w: 0),
                                  // MySizedBox(h: 10, w: 0),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Shipping Charge",
                                        style: TextStyle(
                                          fontFamily: myFont,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        "₹ 50",
                                        style: TextStyle(
                                          fontFamily: myFont,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const MySizedBox(h: 10, w: 0),
                                  const Divider(
                                    color: unselectedItemsColor,
                                  ),
                                  const MySizedBox(h: 10, w: 0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Total",
                                        style: TextStyle(
                                          fontFamily: myFont,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text("₹ ${totalAmount + 50}"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const MySizedBox(h: 90, w: 0),
                        ],
                      )),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {
                        if (address == null) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Select address"),
                            // backgroundColor: Kblue,
                          ));
                        } else {
                          gotoPaymentScreen(
                            context: context,
                            modelCartList: cartList,
                            totalAmount: totalAmount + 50,
                          );
                        }
                        // addressPicker.address == null
                        //     ? ScaffoldMessenger.of(context)
                        //         .showSnackBar(const SnackBar(
                        //         content: Text("Select address"),
                        //         // backgroundColor: Kblue,
                        //       ))
                        //     : gotoPaymentScreen(
                        //         context: context,
                        //         modelCartList: cartList,
                        //         totalAmount: totalAmount + 50,
                        //       );
                      },
                      child: const CheckOutContainer(),
                    ),
                  )
                ],
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class PromocodeTextfiels extends StatelessWidget {
  String hintText;
  void Function() onTap;
  PromocodeTextfiels({
    required this.hintText,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(height: 45, width: 270),
        child: GestureDetector(
          onTap: onTap,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              // prefixIcon: const Icon(Icons.search_rounded),
              hintStyle: const TextStyle(
                fontFamily: "Ubuntu",
                color: hintTextColor,
                fontSize: 14,
              ),
              filled: true,
              fillColor: navBarColor,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
            ),
          ),
        ),
      ),
    );
  }
}

class CheckOutContainer extends StatelessWidget {
  const CheckOutContainer({
    super.key,
  });

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
      child: const Center(
        child: Text(
          "Continue Payment",
          style: TextStyle(
            fontFamily: "Ubuntu",
            color: colorWhite,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// class AddressController extends GetxController {
//   int groupValur = -1;
//   String? name;
//   String? addresName;
//   String? phone;
//   String? pincode;
//   String? city;
//   String? road;
//   String? house;
//   String? state;

//   setAddress(value) {
//     groupValur = value;
//     update();
//   }

//   cahangeAddressonCheckout(ModelAddress? address) {
//     log("....................");
//     name = address!.name;
//     addresName = address.addressName;
//     phone = address.phoneNo;
//     pincode = address.pin;
//     city = address.city;
//     road = address.area;
//     house = address.houseNo;
//     state = address.state;
//     update();
//   }
// }
// Widget buildAddressDetails(ModelAddress modelAddress) {
//   return Padding(
//     padding: const EdgeInsets.only(bottom: 8),
//     child: SizedBox(
//       height: 80,
//       width: double.infinity,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 CircleAvatar(
//                   backgroundColor: unselectedItemsColor,
//                   child: Icon(
//                     Icons.location_pin,
//                     color: colorWhite,
//                   ),
//                 ),
//                 const MySizedBox(h: 0, w: 15),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       address.addressName,
//                       style: const TextStyle(
//                           fontFamily: myFont,
//                           fontWeight: FontWeight.bold,
//                           color: colorBlack),
//                     ),
//                     Text(
//                       address.name,
//                       style: const TextStyle(
//                           fontFamily: myFont, fontSize: 11, color: colorBlack),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 // Radio<SingingCharacter>(
//                 //   value: SingingCharacter.lafayette,
//                 //   groupValue: _character,
//                 //   onChanged: (SingingCharacter? value) {
//                 //     setState(() {
//                 //       _character = value;
//                 //     });
//                 //   },
//                 // ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
enum SingingCharacter { lafayette, jefferson }

// class BuildAddressDetails extends StatefulWidget {
//   const BuildAddressDetails({super.key});

//   @override
//   State<BuildAddressDetails> createState() => _BuildAddressDetailsState();
// }

// class _BuildAddressDetailsState extends State<BuildAddressDetails> {
//   SingingCharacter? _character = SingingCharacter.lafayette;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: SizedBox(
//         height: 80,
//         width: double.infinity,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   CircleAvatar(
//                     backgroundColor: unselectedItemsColor,
//                     child: Icon(
//                       Icons.location_pin,
//                       color: colorWhite,
//                     ),
//                   ),
//                   const MySizedBox(h: 0, w: 15),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         address.addressName == null
//                             ? "Add an Address"
//                             : address.addressName,
//                         style: const TextStyle(
//                             fontFamily: myFont,
//                             fontWeight: FontWeight.bold,
//                             color: colorBlack),
//                       ),
//                       Text(
//                         address.name == null
//                             ? "Add an Address"
//                             : address.addressName,
//                         style: const TextStyle(
//                             fontFamily: myFont,
//                             fontSize: 11,
//                             color: colorBlack),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Radio<SingingCharacter>(
//                 activeColor: unselectedItemsColor,
//                 value: SingingCharacter.lafayette,
//                 groupValue: _character,
//                 onChanged: (SingingCharacter? value) {
//                   setState(() {
//                     _character = value;
//                   });
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// class Model {
//   String myInfo;

//   Model(this.myInfo);
//   setNewInfo(String info) {
//     myInfo = info;
//   }
// void selectUserAction(BuildContext context) async {
//   final result = await Navigator.of(context)
//       .push(MaterialPageRoute(builder: (context) => ScreenAddress()));
//   log("date call back");
//   // log(selectedUser);
//   final String selectedUser = result as String;
//   log(selectedUser);
//   // return selectedUser;
// }
