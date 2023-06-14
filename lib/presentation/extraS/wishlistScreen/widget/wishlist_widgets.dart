import 'package:flutter/material.dart';

import '../../../../core/color/colors.dart';
import '../../../../core/widgets/focus_widgets.dart';
import '../../../home/services/home_screen_services.dart';
import '../../productScreen/screen_product.dart';

class WishlistItemsGridView extends StatelessWidget {
  const WishlistItemsGridView({
    super.key,
    required this.productList,
    // required this.product,
  });
  final List<Product> productList;
  // final Product product;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        childAspectRatio: 1.0,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        final product = productList[index];
        return GestureDetector(
          onTap: () {
            gotoProductScreen(context: context, product: product);
          },
          child: SizedBox(
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: navBarColor,
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                    height: 110,
                    width: MediaQuery.of(context).size.width / 2.15,
                    child: Image.network(product.productImage[0])),
                const MySizedBox(h: 3, w: 0),
                Text(
                  product.producName,
                  style: const TextStyle(
                      fontFamily: "Ubuntu",
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  product.storage,
                  style: const TextStyle(
                      fontFamily: "Ubuntu",
                      fontSize: 11,
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹ ${product.price}",
                      style: const TextStyle(
                          fontFamily: "Ubuntu",
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    // MySizedBox(h: 0, w: 24),
                    Row(
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
                                return GestureDetector(
                                  onTap: () async {
                                    wishlist
                                            .where(
                                              (element) =>
                                                  element.producName +
                                                      element.storage ==
                                                  product.producName +
                                                      product.storage,
                                            )
                                            .isEmpty
                                        ? await addProductToWishlist(
                                            product: product, context: context)
                                        : await deleteDataFromWishlist(
                                            context: context, product: product);
                                  },
                                  child: wishlist
                                          .where(
                                            (element) =>
                                                element.producName +
                                                    element.storage ==
                                                product.producName +
                                                    product.storage,
                                          )
                                          .isEmpty
                                      ? const Icon(
                                          Icons.favorite_border_rounded,
                                          color: colorBlack,
                                          size: 20,
                                        )
                                      : const Icon(
                                          Icons.favorite,
                                          color: colorBlack,
                                          size: 20,
                                        ),
                                );
                              }
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        ),
                        const Text(
                          " | ",
                          style: TextStyle(color: selectedItemsColor),
                        ),
                        const Text(
                          "4.5",
                          style: TextStyle(fontSize: 15),
                        ),
                        const Icon(
                          Icons.star,
                          size: 20,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      itemCount: productList.length,
    );
  }
}
