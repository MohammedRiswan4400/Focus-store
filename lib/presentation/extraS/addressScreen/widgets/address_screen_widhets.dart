import 'package:flutter/material.dart';
import '../../../../core/color/colors.dart';
import '../../../../core/widgets/focus_widgets.dart';
import '../../LocationScreen/screen_location.dart';

// ignore: must_be_immutable

// ignore: must_be_immutable
class AddressListTile extends StatelessWidget {
  String title;
  String subTitle;
  AddressListTile({
    required this.subTitle,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: unselectedItemsColor,
        child: Icon(
          Icons.location_pin,
          color: colorWhite,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(fontFamily: myFont, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subTitle,
        style: const TextStyle(fontFamily: myFont, fontSize: 11),
      ),
      trailing: const CircleAvatar(
        radius: 6,
        backgroundColor: colorBlack,
      ),
    );
  }
}

class AddAddressContainer extends StatelessWidget {
  const AddAddressContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromARGB(255, 123, 123, 123),
              Color.fromARGB(255, 78, 78, 78)
            ]),
      ),
      height: 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Add New Address",
            style: TextStyle(
              fontFamily: myFont,
              color: colorWhite,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}

void gotoShippingAddressDetails(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return const ScreenLocation();
      },
    ),
  );
}
