import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:alqua_online/screens/home/provider/home_screen_provider.dart';
import 'package:alqua_online/utils/color_class.dart';
import 'package:alqua_online/utils/constants.dart';

import '../../models/Cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              const Text(
                "Your Cart",
                style: TextStyle(color: Colors.black),
              ),
              Text(
                "${demoCarts.length} items",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: StreamBuilder(
              stream: _firestore
                  .collection('cart')
                  .doc(firebaseUserNumber)
                  .snapshots(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (!snapshot.hasData || snapshot.data!.data() == null) {
                  return const Text('No items in the cart.');
                }
                Map<String, dynamic> cartData =
                    snapshot.data!.data() as Map<String, dynamic>;
                List<dynamic> products = cartData['products'] ?? [];
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Dismissible(
                        key: Key(products[index]["id"].toString()),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          setState(() {
                            products.removeAt(index);
                          });
                          _firestore
                              .collection('cart')
                              .doc(firebaseUserNumber)
                              .update({
                            'products': products,
                          });
                        },
                        background: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE6E6),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              const Spacer(),
                              SvgPicture.asset("assets/icons/Trash.svg"),
                            ],
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 88,
                              child: AspectRatio(
                                aspectRatio: 0.88,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF5F6F9),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child:
                                      Image.network(products[index]['image']),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    products[index]['name'],
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 16),
                                    maxLines: 2,
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Container(
                                            decoration: BoxDecoration(
                                              color: ColorClass.grayColor
                                                  .withOpacity(0.3),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: const Icon(Icons.add)),
                                        onPressed: () {
                                          setState(() {
                                            products[index]['qty']++;
                                          });
                                          _firestore
                                              .collection('cart')
                                              .doc(firebaseUserNumber)
                                              .update({
                                            'products': products,
                                          });
                                        },
                                      ),
                                      Text(
                                        products[index]['qty'].toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      IconButton(
                                        icon: Container(
                                          decoration: BoxDecoration(
                                            color: ColorClass.grayColor
                                                .withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: const Icon(
                                            Icons.remove,
                                          ),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if (products[index]['qty'] > 1) {
                                              products[index]['qty']--;
                                            }
                                          });
                                          _firestore
                                              .collection('cart')
                                              .doc(firebaseUserNumber)
                                              .update({
                                            'products': products,
                                          });
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                );
              }),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          // height: 174,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, -15),
                blurRadius: 20,
                color: const Color(0xFFDADADA).withOpacity(0.15),
              )
            ],
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F6F9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset("assets/icons/receipt.svg"),
                    ),
                    const Spacer(),
                    const Text("Add voucher code"),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: kTextColor,
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    // const Expanded(
                    //   child: Text.rich(
                    //     // TextSpan(
                    //     //   text: "Total:\n",
                    //     //   children: [
                    //     //     TextSpan(
                    //     //       text: "\$337.15",
                    //     //       style: TextStyle(fontSize: 16, color: Colors.black),
                    //     //     ),
                    //     //   ],
                    //     // ),
                    //   ),
                    // ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          DocumentSnapshot cartSnapshot = await _firestore
                              .collection('cart')
                              .doc(firebaseUserNumber)
                              .get();
                          List<dynamic> products = (cartSnapshot.data()
                              as Map<String, dynamic>)['products'];

                          DocumentSnapshot orderSnapshot = await _firestore
                              .collection('orders')
                              .doc(firebaseUserNumber)
                              .get();

                          if (orderSnapshot.exists) {
                            // If order exists, append products to the existing order
                            List<dynamic> existingProducts = (orderSnapshot
                                .data() as Map<String, dynamic>)['products'];
                            products.addAll(existingProducts);
                          }

// Set or update the order with the combined products
                          await _firestore
                              .collection('orders')
                              .doc(firebaseUserNumber)
                              .set({
                            'products': products,
                          });

// Clear products from the cart
                          await _firestore
                              .collection('cart')
                              .doc(firebaseUserNumber)
                              .update({
                            'products': [],
                          });
                        },
                        child: const Text("Check Out"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
