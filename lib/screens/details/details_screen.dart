import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/home/models/products_model.dart';
import 'components/color_dots.dart';
import 'components/product_description.dart';
import 'components/product_images.dart';
import 'components/top_rounded_container.dart';

class DetailsScreen extends StatefulWidget {
  static String routeName = "/details";
  final GetAllProducts product;

  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    const Text(
                      "4.7",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    SvgPicture.asset("assets/icons/Star Icon.svg"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          ProductImages(product: widget.product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                  product: widget.product,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  color: const Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      ColorDots(product: widget.product),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: TopRoundedContainer(
        color: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: ElevatedButton(
              onPressed: () {
                // add to cart functionality
                _firestore
                    .collection('cart')
                    .doc("971506375562")
                    .get()
                    .then((value) {
                  if (value.exists) {
                    Map<String, dynamic> cartData =
                        value.data() as Map<String, dynamic>;
                    List<dynamic> products = cartData['products'] ?? [];
                    products.add({
                      'name': widget.product.name,
                      'image': widget.product.images.isEmpty
                          ? "https://via.placeholder.com/150"
                          : widget.product.images[0].src,
                      'qty': 1,
                      'productId': widget.product.id,
                    });
                    _firestore
                        .collection('cart')
                        .doc("971506375562")
                        .update({'products': products});
                  } else {
                    _firestore.collection('cart').doc("971506375562").set({
                      'products': [
                        {
                          'name': widget.product.name,
                          'image': widget.product.images.isEmpty
                              ? "https://via.placeholder.com/150"
                              : widget.product.images[0].src,
                          'qty': 1,
                          'productId': widget.product.id,
                        }
                      ]
                    });
                  }
                });
                // Navigator.pushNamed(context, CartScreen.routeName);
              },
              child:
                  // check if the product is already in the cart

                  const Text("Add To Carts"),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductDetailsScreen extends StatefulWidget {
  static String routeName = "/details";
  final GetAllProducts product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    const Text(
                      "4.7",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    SvgPicture.asset("assets/icons/Star Icon.svg"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          ProductImages(product: widget.product),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                  product: widget.product,
                  pressOnSeeMore: () {},
                ),
                TopRoundedContainer(
                  color: const Color(0xFFF6F7F9),
                  child: Column(
                    children: [
                      ColorDots(product: widget.product),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: TopRoundedContainer(
        color: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: ElevatedButton(
              onPressed: () {
                // add to cart functionality
                _firestore
                    .collection('cart')
                    .doc("971506375562")
                    .get()
                    .then((value) {
                  if (value.exists) {
                    Map<String, dynamic> cartData =
                        value.data() as Map<String, dynamic>;
                    List<dynamic> products = cartData['products'] ?? [];
                    products.add({
                      'name': widget.product.name,
                      'image': widget.product.images.isEmpty
                          ? "https://via.placeholder.com/150"
                          : widget.product.images[0].src,
                      'qty': 1,
                      'productId': widget.product.id,
                    });
                    _firestore
                        .collection('cart')
                        .doc("971506375562")
                        .update({'products': products});
                  } else {
                    _firestore.collection('cart').doc("971506375562").set({
                      'products': [
                        {
                          'name': widget.product.name,
                          'image': widget.product.images.isEmpty
                              ? "https://via.placeholder.com/150"
                              : widget.product.images[0].src,
                          'qty': 1,
                          'productId': widget.product.id,
                        }
                      ]
                    });
                  }
                });
                // Navigator.pushNamed(context, CartScreen.routeName);
              },
              child:
                  // check if the product is already in the cart

                  const Text("Add To Cart"),
            ),
          ),
        ),
      ),
    );
  }
}
