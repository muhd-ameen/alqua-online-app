import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:souq_alqua/screens/home/models/products_model.dart';

import 'package:share_plus/share_plus.dart';
import 'package:souq_alqua/utils/constants.dart';

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  product.name ?? "",
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: kBlackColor,
                    fontSize: 18,
                    fontFamily: kFontFamily,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Container(
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
                      'Hey,\n*Check out this product*\n\n${product.name} on Toycar Showroom \n\nShop now 🛒  - ${product.permalink}\n\nDownload the app from Play Store - https://play.google.com/store/apps/details?id=com.souq_alqua\n\n',
                    );
                  },
                  icon: const Icon(
                    Icons.share,
                    color: Colors.black,
                    size: 16,
                  ),
                )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: "Description ",
                  style: const TextStyle(
                    color: kBlackColor,
                    fontSize: 15,
                    fontFamily: kFontFamily,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: product.description == null
                          ? ""
                          : product.description!.replaceAll(
                              RegExp(r'<[^>]*>'),
                              '',
                            ),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: const Color(0xFF777777),
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
              Html(
                data: product.shortDescription == null
                    ? ""
                    : product.shortDescription!,
                style: {
                  "h3": Style(
                    color: const Color(0xFF777777),
                    fontSize: FontSize.medium,
                  ),
                  "div": Style(
                    color: const Color(0xFF777777),
                    fontSize: FontSize.large,
                  ),
                },
              ),
              Column(
                children: product.attributes.map((e) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 70,
                            child: Text(
                              e.name ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: const Color(0xFF777777),
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Row(
                            children: [
                              Text(
                                e.options.first,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: kBlackColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              const SizedBox(width: 4),
                              Visibility(
                                visible: e.name == "Rating",
                                child: SvgPicture.asset(
                                  "assets/icons/Star Icon.svg",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
