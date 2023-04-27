import 'package:flutter/material.dart';
import '../../../../core/color/colors.dart';

// ignore: must_be_immutable
class ProfileWithoutTextField extends StatelessWidget {
  String hintText;
  ProfileWithoutTextField({
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(height: 45),
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
    );
  }
}

// ignore: must_be_immutable
class ProfileWithTextField extends StatelessWidget {
  String hintText;
  Icon icon;
  TextInputType keyboardType;
  void Function() onTap;
  ProfileWithTextField({
    required this.hintText,
    required this.icon,
    required this.onTap,
    required this.keyboardType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(height: 45),
        child: GestureDetector(
          onTap: onTap,
          child: TextFormField(
            keyboardType: keyboardType,
            decoration: InputDecoration(
              suffixIcon: icon,
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
