import 'package:flutter/material.dart';
import 'package:souq_alqua/models/Product.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text(
            "Favorites",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: demoProducts.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) => Container(),

                // itemBuilder: (context, index) => ProductCard(
                //   product: GetAllProducts(),
                //   onPress: () {
                //   //   Navigator.pushNamed(
                //   //   context,
                //   //   DetailsScreen.routeName,
                //   //   arguments:
                //   //       ProductDetailsArguments(product: demoProducts[index]),
                //   // );
                //   },
                // ),
              ),
            ),
          )
        ],
      ),
    );
  }
}