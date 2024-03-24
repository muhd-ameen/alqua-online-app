import 'package:alqua_online/utils/animation_class.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:alqua_online/components/product_card.dart';
import 'package:alqua_online/screens/details/details_screen.dart';
import 'package:alqua_online/screens/home/components/search_field.dart';
import 'package:alqua_online/screens/home/provider/home_screen_provider.dart';
import 'package:alqua_online/utils/constants.dart';

class SearchProductsScreen extends StatefulWidget {
  const SearchProductsScreen({
    super.key,
  });

  @override
  State<SearchProductsScreen> createState() => _SearchProductsScreenState();
}

class _SearchProductsScreenState extends State<SearchProductsScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<HomeProvider>(
          builder: (context, snapshot, child) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  autofocus: true,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      Future.delayed(const Duration(milliseconds: 500), () {
                        snapshot.searchProducts(value);
                      });
                    } else {
                      snapshot.clearSearchList();
                    }
                  },
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
                const SizedBox(height: 16),
                snapshot.searchProductList.isEmpty
                    ? Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              AnimationClass.noData,
                              height: 200,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              "لا توجد نتائج",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: GridView.builder(
                            itemCount: snapshot.searchProductList.length,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 0.7,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 16,
                            ),
                            itemBuilder: (context, index) => ProductCard(
                              product: snapshot.searchProductList[index],
                              onPress: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                    product: snapshot.searchProductList[index],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
