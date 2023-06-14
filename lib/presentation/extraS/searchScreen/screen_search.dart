import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:focus_store/presentation/home/services/home_screen_services.dart';
import 'package:focus_store/presentation/home/widget/home_widgets.dart';

import '../../../core/color/colors.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key, required this.products});
  final List<Product> products;
  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  List<Product>? sercheddProductList;
  void searchProducts(String searchValue) {
    setState(() {
      sercheddProductList = widget.products
          .where((product) => product.producName
              .toLowerCase()
              .contains(searchValue.toLowerCase()))
          .toList();
    });
  }

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    sercheddProductList = widget.products;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: TextFormField(
          focusNode: FocusNode(),
          // onSubmitted: (value) {
          //   // Do something with the value
          // },
          // autofocus: FocusScope.of(context).unfocus(),
          // onTap: () {
          //   FocusScope.of(context).unfocus();
          // },
          controller: controller,
          onChanged: (text) {
            searchProducts(text);
            // setState(() {
            //   products = products
            //       ?.where((product) =>
            //           product.name.toLowerCase().contains(text.toLowerCase()))
            //       .toList();
            // });
          },
          // focusNode: FocusNode. ,
          decoration: InputDecoration(
            hintText: "iPhone,Samsung,oppo....",

            // prefixIcon: const Icon(Icons.search_rounded),
            hintStyle: const TextStyle(
                fontFamily: "Ubuntu", color: hintTextColor, fontSize: 14),
            filled: true,
            isDense: true,
            contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            fillColor: navBarColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
        backgroundColor: Colors.white.withAlpha(200),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        shadowColor: colorTransperant,
        toolbarHeight: 60,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              child: GridView.builder(
                itemCount: sercheddProductList!.length,
                itemBuilder: (context, index) {
                  final product = sercheddProductList![index];
                  return buildProduct(product: product, context: context);
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10,
                ),
                primary: false,
                shrinkWrap: true,
                // children: product.map(buildProduct).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class Product {
//   final String name;

//   Product({required this.name});
// }
