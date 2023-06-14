import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:focus_store/presentation/extraS/widgets/extra_screens_main_widgets.dart';
import 'package:lottie/lottie.dart';
import '../../../core/color/colors.dart';
import '../productScreen/screen_product.dart';
import 'widget/wishlist_widgets.dart';

class ScreenWishlist extends StatelessWidget {
  const ScreenWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const AppbarPop(),
        title: AppBArTitle(
          title: 'My Wishlist',
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
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
        ),
        child: StreamBuilder(
            stream: fetchDataFromWishlist(),
            builder: (contex, snapshott) {
              if (snapshott.hasError) {
                return Center(child: Text(snapshott.error.toString()));
              } else if (snapshott.hasData) {
                final wishList = snapshott.data;

                if (wishList == null) {
                  return const CircularProgressIndicator();
                } else {
                  if (wishList.isEmpty) {
                    return Center(
                      child: Lottie.network(
                        "https://assets9.lottiefiles.com/packages/lf20_lwnuxmxm.json",
                      ),
                    );
                  } else {
                    return WishlistItemsGridView(
                      productList: wishList,
                      // product: wishList.first,
                    );
                  }
                }
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
