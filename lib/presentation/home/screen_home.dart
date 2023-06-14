// import 'package:carousel_slider/carousel_controller.dart';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/services.dart';
import 'package:focus_store/core/widgets/focus_widgets.dart';
import '../../core/color/colors.dart';
import 'widget/home_widgets.dart';
import 'widget/indemand_one.dart';
import 'widget/indemand_three.dart';
import 'widget/indemand_two.dart';

List imageList = [
  {"id": 1, "image_path": "assets/firstPoster.png"},
  {"id": 2, "image_path": "assets/s23banner.png"},
  {"id": 3, "image_path": "assets/onePlus10.png"},
];

final CarouselController carouselController = CarouselController();
int currentIndex = 0;

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
// MediaQuery heightMedia = MediaQuery

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: const AppbarSearchHome(),
        backgroundColor: Colors.white.withAlpha(400),
        shadowColor: colorTransperant,
        toolbarHeight: 60,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: const Color.fromARGB(128, 255, 255, 255),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: colorTransperant,
                  ),
                  height: 187,
                  width: double.infinity,
                  child: InkWell(
                    onTap: () {
                      // SystemChrome.setSystemUIMode(SystemUiMode.immersive);
                    },
                    child: CarouselSlider(
                      items: imageList
                          .map(
                            (item) => ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                item["image_path"],
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                          .toList(),
                      carouselController: carouselController,
                      options: CarouselOptions(
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlay: true,
                        aspectRatio: 2,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imageList.asMap().entries.map(
                      (entry) {
                        return GestureDetector(
                          onTap: () =>
                              carouselController.animateToPage(entry.key),
                          child: Container(
                            width: currentIndex == entry.key ? 20 : 15,
                            height: 3,
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: currentIndex == entry.key
                                  ? selectedItemsColor
                                  : unselectedItemsColor,
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                )
              ],
            ),
            const MySizedBox(h: 15, w: 0),
            const Text(
              "In Demand",
              style: TextStyle(
                  fontFamily: "Ubuntu",
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const MySizedBox(h: 5, w: 0),
            const Row(
              children: [
                InDemandContainerOne(),
                MySizedBox(h: 0, w: 9),
                Column(
                  children: [
                    InDemandContainerTwo(),
                    MySizedBox(h: 10, w: 0),
                    InDemandContainerThree(),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "New Arrival Phones",
              style: TextStyle(
                  fontFamily: "Ubuntu",
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const MySizedBox(h: 5, w: 0),
            StreamBuilder(
              stream: readProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      "Somthing went wrong!",
                    ),
                  );
                } else if (snapshot.hasData) {
                  final products = snapshot.data!;
                  return GridView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return buildProduct(product: product, context: context);
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 10,
                    ),
                    primary: false,
                    shrinkWrap: true,
                    // children: product.map(buildProduct).toList(),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            //
          ],
        ),
      ),
    );
    // );
  }
}
