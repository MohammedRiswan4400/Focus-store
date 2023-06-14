import 'package:flutter/material.dart';

import '../../../../core/color/colors.dart';
import '../../../../core/widgets/focus_widgets.dart';

// class PriceColumnWidget extends StatelessWidget {
//   const PriceColumnWidget({
//     super.key,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "vivo x 90",
//           style: TextStyle(
//               fontFamily: "Ubuntu", fontWeight: FontWeight.w600, fontSize: 18),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               "12 GB ram | 256 GB rom",
//               style: TextStyle(
//                   fontFamily: "Ubuntu",
//                   fontWeight: FontWeight.w500,
//                   fontSize: 15),
//             ),
//             Row(
//               children: const [
//                 Text(
//                   "4.5",
//                   style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                       fontFamily: "Ubuntu"),
//                 ),
//                 MySizedBox(
//                   h: 0,
//                   w: 4,
//                 ),
//                 Icon(
//                   Icons.star,
//                   size: 20,
//                 ),
//               ],
//             ),
//           ],
//         ),
//         const Text(
//           "₹65,999",
//           style: TextStyle(
//               fontFamily: "Ubuntu", fontWeight: FontWeight.w600, fontSize: 18),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: const [
//             Text(
//               "₹79,999",
//               style: TextStyle(
//                   fontFamily: "Ubuntu",
//                   color: selectedItemsColor,
//                   fontWeight: FontWeight.w600,
//                   decoration: TextDecoration.lineThrough,
//                   fontSize: 15),
//             ),
//             // GestureDetector(
//             //   onTap: () {
//             //     showModalBottomSheet(
//             //       barrierColor: modelSheetBarrierColor,
//             //       backgroundColor: colorTransperant,
//             //       // enableDrag: true,
//             //       context: context,
//             //       builder: (context) {
//             //         return Container(
//             //           decoration: const BoxDecoration(
//             //               color: colorWhite,
//             //               // border: Border.all(width: 2),
//             //               borderRadius:
//             //                   BorderRadius.vertical(top: Radius.circular(20))),
//             //           height: 450,
//             //           width: double.infinity,
//             //           child: Padding(
//             //             padding:
//             //                 const EdgeInsets.only(top: 8, left: 0, right: 15),
//             //             child: Column(
//             //               crossAxisAlignment: CrossAxisAlignment.start,
//             //               children: [
//             //                 Center(
//             //                   child: Container(
//             //                     decoration: BoxDecoration(
//             //                       color: const Color.fromARGB(255, 94, 94, 94),
//             //                       borderRadius: BorderRadius.circular(310),
//             //                     ),
//             //                     height: 7,
//             //                     width: 30,
//             //                   ),
//             //                 ),
//             //                 const MySizedBox(h: 20, w: 0),
//             //                 const Padding(
//             //                   padding: EdgeInsets.only(left: 18),
//             //                   child: Text(
//             //                     "Reviews",
//             //                     style: TextStyle(
//             //                         fontFamily: "Ubuntu", fontSize: 20),
//             //                   ),
//             //                 ),
//             //                 const MySizedBox(h: 20, w: 0),
//             //                 const ListTile(
//             //                   leading: CircleAvatar(
//             //                     backgroundColor: colorBlack,
//             //                   ),
//             //                   title: Text(
//             //                     "Ram",
//             //                     style: TextStyle(
//             //                       color: colorBlack,
//             //                       fontFamily: "Ubuntu",
//             //                       fontSize: 15,
//             //                     ),
//             //                   ),
//             //                   subtitle: Text(
//             //                     "is simply dummy text of the printing and type setting industry. Lorem Ipsum ",
//             //                     style: TextStyle(
//             //                       color: colorBlack,
//             //                       fontFamily: "Ubuntu",
//             //                       fontSize: 12,
//             //                     ),
//             //                   ),
//             //                 ),
//             //                 const Divider(
//             //                   color: unselectedItemsColor,
//             //                   indent: 20,
//             //                 ),
//             //               ],
//             //             ),
//             //           ),
//             //         );
//             //       },
//             //     );
//             //   },
//             //   child: const Text(
//             //     "2k reviews",
//             //     style: TextStyle(
//             //       fontSize: 12,
//             //       fontWeight: FontWeight.w500,
//             //       fontFamily: "Ubuntu",
//             //     ),
//             //   ),
//             // ),
//             Text(
//               "2k reviews",
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w500,
//                 fontFamily: "Ubuntu",
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

class ColorRow extends StatelessWidget {
  const ColorRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Row(
      children: const [
        CircleAvatar(
          backgroundColor: Color.fromARGB(211, 0, 0, 0),
          radius: 20,
        ),
        MySizedBox(h: 0, w: 5),
        CircleAvatar(
          backgroundColor: Color.fromARGB(250, 243, 68, 68),
          radius: 20,
        ),
        MySizedBox(h: 0, w: 5),
        CircleAvatar(
          backgroundColor: Color.fromARGB(255, 131, 206, 244),
          radius: 20,
        ),
      ],
    );
  }
}

class AddToCartRow extends StatelessWidget {
  const AddToCartRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text(
          "Add to Cart",
          style: TextStyle(
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const MySizedBox(h: 0, w: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: navBarColor,
          ),
          height: 40,
          width: 70,
          child: const Icon(Icons.shopping_cart_rounded),
        )
      ],
    );
  }
}
