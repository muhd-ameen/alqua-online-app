import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/home/provider/home_screen_provider.dart';

import '../../../components/product_card.dart';
import '../../../models/Product.dart';
import '../../details/details_screen.dart';
import '../../products/products_screen.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, snapshot, child) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SectionTitle(
              title: "المنتجات الشعبية",
              press: () {},
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  snapshot.allProducts.length,
                  (index) {
                    if (demoProducts[index].isPopular) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: DynamicProductCard(
                          product: snapshot.allProducts[index],
                          onPress: () {
                            //   Navigator.pushNamed(
                            //   context,
                            //   DetailsScreen.routeName,
                            //   arguments: ProductDetailsArguments(
                            //       product: snapshot.allProducts[index]),
                            // );
                          },
                        ),
                      );
                    }

                    return const SizedBox
                        .shrink(); // here by default width and height is 0
                  },
                ),
                const SizedBox(width: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
