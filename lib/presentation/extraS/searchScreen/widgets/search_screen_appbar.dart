import 'package:flutter/material.dart';

import '../../../../core/color/colors.dart';

class SearchScreenAppbar extends StatelessWidget {
  const SearchScreenAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}
