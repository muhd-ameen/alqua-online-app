import 'package:flutter/material.dart';
import 'package:alqua_online/screens/home/components/search_screen.dart';

import 'package:alqua_online/utils/constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const SearchProductsScreen()));
        },
        readOnly: true,
        decoration: InputDecoration(
          filled: true,
          fillColor: kSecondaryColor.withOpacity(0.1),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          border: searchOutlineInputBorder,
          focusedBorder: searchOutlineInputBorder,
          enabledBorder: searchOutlineInputBorder,
          hintText: "البحث عن المنتجات",
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}

const searchOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);
