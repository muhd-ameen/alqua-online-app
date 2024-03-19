import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:alqua_online/screens/home/models/products_model.dart';

import 'package:alqua_online/utils/constants.dart';

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
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.all(16),
            width: 48,
            decoration: const BoxDecoration(
              color: Color(0xFFF5F6F9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SvgPicture.asset(
              "assets/icons/Heart Icon_2.svg",
              colorFilter:
                  const ColorFilter.mode(Color(0xFFDBDEE4), BlendMode.srcIn),
              height: 16,
            ),
          ),
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
