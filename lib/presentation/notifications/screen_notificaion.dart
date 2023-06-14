import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:focus_store/core/color/colors.dart';
import 'package:focus_store/core/widgets/focus_widgets.dart';
import '../home/screen_home.dart';
import 'widgets/notification_screen_widgets.dart';

List notificationImages = [
  {"id": 1, "image_path": "assets/Screenshot 2023-04-12 141548.png"},
  {"id": 2, "image_path": "assets/Screenshot 2023-04-12 142801.png"},
  {"id": 3, "image_path": "assets/Screenshot 2023-04-12 141626.png"},
];

class ScreenNotification extends StatefulWidget {
  const ScreenNotification({super.key});

  @override
  State<ScreenNotification> createState() => _ScreenNotificationState();
}

class _ScreenNotificationState extends State<ScreenNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const NotificationTitle(),
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
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    // color: navBarColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 180,
                  width: double.infinity,
                  child: CarouselSlider(
                    items: notificationImages
                        .map(
                          (item) => ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              item["image_path"],
                              fit: BoxFit.cover,
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
                        setState(
                          () {
                            currentIndex = index;
                          },
                        );
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
                    children: imageList.asMap().entries.map((entry) {
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
                    }).toList(),
                  ),
                )
              ],
            ),
            const MySizedBox(h: 200, w: 0),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "No Older Notification",
                style: TextStyle(
                    fontFamily: "Ubuntu", fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
