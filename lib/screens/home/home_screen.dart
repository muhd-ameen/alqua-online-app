import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alqua_online/screens/home/provider/home_screen_provider.dart';

import 'components/categories.dart';
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
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    Future.microtask(() {
      homeProvider.getAllCategories(context);
      homeProvider.getAllProducts(context);
    });
    super.initState();
  }

  Future<void> onRefresh() async {
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: false);
    homeProvider.getAllCategories(context);
    homeProvider.getAllProducts(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: const SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                HomeHeader(),
                DiscountBanner(),
                Categories(),
                PopularProducts(),
                SizedBox(height: 20),
                CategoryView(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
