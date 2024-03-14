import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/home/provider/home_screen_provider.dart';

import '../details/details_screen.dart';

class ProductsScreen extends StatefulWidget {
  final int categoryId;

  const ProductsScreen({super.key, required this.categoryId});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    Future.microtask(() {
      homeProvider.getAllProductsByCategory(widget.categoryId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: SafeArea(
        child: Consumer<HomeProvider>(
          builder: (context, snapshot, child) =>
              snapshot.getAllProductsByCategoryLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.builder(
                        itemCount: snapshot.allProductsByCategory.length,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 0.7,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 16,
                        ),
                        itemBuilder: (context, index) => ProductByCategoryCard(
                          product: snapshot.allProductsByCategory[index],
                          onPress: () => Navigator.pushNamed(
                            context,
                            DetailsScreen.routeName,
                            arguments: ProductDetailsArguments(
                                product: snapshot.allProductsByCategory[index]),
                          ),
                        ),
                      ),
                    ),
        ),
      ),
    );
  }
}
