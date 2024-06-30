import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:souq_alqua/screens/home/provider/home_screen_provider.dart';
import 'package:souq_alqua/screens/product/product_detail_screen/product_details_screen.dart';
import 'package:souq_alqua/components/product_card.dart';
import 'section_title.dart';

class TopSellingProducts extends StatelessWidget {
  const TopSellingProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, productsProvider, child) {
        return Visibility(
          visible: productsProvider.topSellingProduct.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: SectionTitle(
                    title: "Top Selling 🔥",
                    press: null,
                  ),
                ),
                const SizedBox(height: 10),
                productsProvider.isTopSellingLoading
                    ? Center(
                        child: LoadingAnimationWidget.horizontalRotatingDots(
                        color: Colors.redAccent,
                        size: 30,
                      ))
                    : SingleChildScrollView(
                        padding: const EdgeInsets.only(left: 20),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...List.generate(
                                productsProvider.topSellingProduct.length > 15
                                    ? 15
                                    : productsProvider.topSellingProduct.length,
                                (index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: DynamicProductCard(
                                  product:
                                      productsProvider.topSellingProduct[index],
                                  onPress: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailsScreen(
                                            product: productsProvider
                                                .topSellingProduct[index],
                                          ),
                                        ));
                                  },
                                ),
                              );
                            }),
                            const SizedBox(width: 20),
                          ],
                        )),
              ],
            ),
          ),
        );
      },
    );
  }
}
