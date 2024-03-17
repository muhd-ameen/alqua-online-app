import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/home/provider/home_screen_provider.dart';

import '../../../components/product_card.dart';
import '../../details/details_screen.dart';
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
                ...List.generate(snapshot.allProducts.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: DynamicProductCard(
                      product: snapshot.allProducts[index],
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  ProductDetailsScreen(
                                product: snapshot.allProducts[index],
                              ),
                            ));
                      },
                    ),
                  );
                }
// here by defaultå
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
