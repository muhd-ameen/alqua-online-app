import 'package:flutter/material.dart';
import 'package:alqua_online/screens/home/models/products_model.dart';

import 'package:alqua_online/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final GetAllProducts product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            product.name ?? "",
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
              padding: const EdgeInsets.all(4),
              width: 65,
              decoration: const BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: IconButton(
                onPressed: () {
                  Share.share(
                    'Check out this product\n\n${product.name} on Alqua Online\n\nCall - +97137356288\n\nDownload the app from Apple App Store - https://apps.apple.com/us/app/alqua-online/id1587721287\n\n',
                  );
                },
                icon: const Icon(
                  Icons.share,
                  color: Colors.black,
                  size: 16,
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 64,
          ),
          child: Text(
            product.description ?? "",
            maxLines: 3,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          child: GestureDetector(
            onTap: () {},
            child: const Row(
              children: [
                Text(
                  "See More Detail",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
