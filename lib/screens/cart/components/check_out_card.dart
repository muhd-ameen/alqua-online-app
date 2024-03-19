import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/home/provider/home_screen_provider.dart';
import 'package:shop_app/utils/constants.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    return Container(
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
                    onPressed: () {
                      /// add cart items to user phoneNumber doc inside orders collection  and clear the cart
                      firestore
                          .collection('orders')
                          .doc(firebaseUserNumber)
                          .set({
                        'products': [
                          {
                            'name': 'Product Name',
                            'image': 'https://via.placeholder.com/150',
                            'qty': 1,
                            'productId': '0'
                          },
                          {
                            'name': 'Product Name',
                            'image': 'https://via.placeholder.com/150',
                            'qty': 1,
                            'productId': '1',
                          },
                          {
                            'name': 'Product Name',
                            'image': 'https://via.placeholder.com/150',
                            'qty': 3,
                            'productId': '2',
                          }
                        ]
                      });
                      // `_firestore
                      //     .collection('cart')
                      //     .doc(firebaseUserNumber)
                      //     .update({'products': []});`
                    },
                    child: const Text("Check Out"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
