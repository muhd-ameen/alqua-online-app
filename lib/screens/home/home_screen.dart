import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:souq_alqua/screens/cart/providers/appwrite_cart_provider.dart';
import 'package:souq_alqua/screens/home/components/top_selling_products.dart';
import 'package:souq_alqua/screens/order_screens/delivery_locations/providers/delivery_location_provider.dart';
import 'package:souq_alqua/screens/home/provider/home_screen_provider.dart';
import 'package:souq_alqua/screens/authentication/sign_in/provider/login_provider.dart';

import 'package:souq_alqua/utils/image_class.dart';

import 'components/discount_banner.dart';
import 'components/home_header.dart';
import 'components/popular_product.dart';
import 'components/category_view.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    // Access providers once at the beginning
    final HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    final LoginProvider loginProvider =
        Provider.of<LoginProvider>(context, listen: false);
    final AppwriteCartProvider appwriteCartProvider =
        Provider.of<AppwriteCartProvider>(context, listen: false);

    // Use Future.microtask to handle asynchronous operations
    Future.microtask(() async {
      final futures = <Future>[];

      if (homeProvider.allCategories.isEmpty) {
        futures.add(homeProvider.getAllCategories(context));
      }
      if (homeProvider.allProducts.isEmpty) {
        futures.add(homeProvider.getAllProducts(context));
      }
      if (homeProvider.topSellingProduct.isEmpty) {
        futures.add(homeProvider.fetchProductsByTagSlug('top-selling'));
      }
      if (loginProvider.userId == null) {
        futures.add(loginProvider.getPreference());
      }
      futures.add(appwriteCartProvider.getCartLength());

      // Wait for all futures to complete
      await Future.wait(futures);
    });
  }

  Future<void> onRefresh() async {
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    homeProvider.getAllCategories(context);
    homeProvider.getAllProducts(context);
    homeProvider.fetchProductsByTagSlug('top-selling');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CountrySelection(),
        centerTitle: true,
        title: Image.asset(
          ImageClass.appIcon,
          height: 55,
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: const SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 0),
            child: Column(
              children: [
                HomeHeader(),
                HomeBanner(),
                CategoryView(),
                TopSellingProducts(),
                SizedBox(height: 20),
                PopularProducts(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CountrySelection extends StatelessWidget {
  const CountrySelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressProvider>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextButton(
          onPressed: () {
            final countryList = [
              'UAE 🇦🇪',
              'Saudi Arabia 🇸🇦',
              'Kuwait 🇰🇼',
              'Bahrain 🇧🇭',
              'Oman 🇴🇲',
              'Qatar 🇶🇦',
            ];
            if (countryList.isNotEmpty) {
              floatingSnackBar(
                  message: 'Currently we are only serving in UAE 🇦🇪',
                  context: context);

              return;
            } else {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Select Country',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                        const Divider(),
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: countryList.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: value.userSelectedCountry ==
                                        countryList[index]
                                    ? const Icon(Icons.check)
                                    : const Icon(Icons.radio_button_unchecked),
                                title: Text(countryList[index],
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: value.userSelectedCountry ==
                                                countryList[index]
                                            ? Colors.black
                                            : Colors.grey,
                                        fontWeight: FontWeight.w600)),
                                onTap: () {
                                  // value.selectOrUpdateCountry(
                                  //   countryList[index],
                                  // );
                                  floatingSnackBar(
                                      message:
                                          'Currently we are only serving in UAE 🇦🇪',
                                      context: context);

                                  Navigator.of(context).pop();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
          child: Text(
              // only the emoji
              value.userSelectedCountry == null
                  ? ""
                  : value.userSelectedCountry!.split(' ').last,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 15,
                  )),
        ),
      ),
    );
  }
}
