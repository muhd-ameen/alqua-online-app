// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:souq_alqua/screens/home/models/products_model.dart';

// class CartProvider extends ChangeNotifier {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   FirebaseAuth auth = FirebaseAuth.instance;

//   // total length of the cart for the logged-in user
//   Future<int> getCartLength() async {
//     final cartDoc =
//         await _firestore.collection('cart').doc(auth.currentUser!.email).get();

//     if (cartDoc.exists) {
//       final products = cartDoc.data()?['products'] as List<dynamic>? ?? [];
//       return products.length;
//     } else {
//       return 0;
//     }
//   }

//   bool isAddtoCartLoading = false;
//   Future<void> addToCart(GetAllProducts product) async {
//     isAddtoCartLoading = true;
//     notifyListeners();
//     final user = auth.currentUser!;
//     final cartDocRef = _firestore.collection('cart').doc(user.email);

//     await _firestore.runTransaction((transaction) async {
//       final cartDoc = await transaction.get(cartDocRef);

//       if (cartDoc.exists) {
//         Map<String, dynamic> cartData = cartDoc.data() as Map<String, dynamic>;
//         List<dynamic> products = cartData['products'] ?? [];

//         int existingProductIndex =
//             products.indexWhere((prod) => prod['productId'] == product.id);

//         if (existingProductIndex != -1) {
//           products[existingProductIndex]['qty'] += 1;
//         } else {
//           products.add({
//             'name': product.name,
//             'image': product.images.isEmpty
//                 ? "https://via.placeholder.com/150"
//                 : product.images[0].src,
//             'qty': 1,
//             'productId': product.id,
//             'price': double.parse(product.price ?? '0'),
//           });
//         }

//         transaction.update(cartDocRef, {'products': products});
//       } else {
//         transaction.set(cartDocRef, {
//           'products': [
//             {
//               'name': product.name,
//               'image': product.images.isEmpty
//                   ? "https://via.placeholder.com/150"
//                   : product.images[0].src,
//               'qty': 1,
//               'productId': product.id,
//               'price': double.parse(product.price ?? '0'),
//             }
//           ]
//         });
//       }
//     });

//     isAddtoCartLoading = false;
//     notifyListeners();
//   }

//   Stream<DocumentSnapshot> getCartStream() {
//     return _firestore
//         .collection('cart')
//         .doc(auth.currentUser!.email)
//         .snapshots();
//   }

//   Future<void> addProductQuantity(int index, List<dynamic> products) async {
//     products[index]['qty']++;
//     await _firestore
//         .collection('cart')
//         .doc(auth.currentUser!.email)
//         .update({'products': products});
//     notifyListeners();
//   }

//   Future<void> removeProductQuantity(int index, List<dynamic> products) async {
//     if (products[index]['qty'] > 1) {
//       products[index]['qty']--;
//       await _firestore
//           .collection('cart')
//           .doc(auth.currentUser!.email)
//           .update({'products': products});
//       notifyListeners();
//     }
//   }

//   Future<void> removeProduct(int index, List<dynamic> products) async {
//     products.removeAt(index);
//     await _firestore
//         .collection('cart')
//         .doc(auth.currentUser!.email)
//         .update({'products': products});
//     notifyListeners();
//   }

//   bool isCartLoading = false;
//   Future<void> checkout() async {
//     isCartLoading = true;
//     notifyListeners();
//     final user = auth.currentUser!;
//     final cartDoc = await _firestore.collection('cart').doc(user.email).get();
//     if (!cartDoc.exists) return;

//     final products = (cartDoc.data()!['products'] ?? []) as List<dynamic>;

//     final orderDoc =
//         await _firestore.collection('orders').doc(user.email).get();
//     if (orderDoc.exists) {
//       List<dynamic> existingProducts =
//           (orderDoc.data()!['products'] ?? []) as List<dynamic>;
//       products.addAll(existingProducts);
//     }

//     await _firestore
//         .collection('orders')
//         .doc(user.email)
//         .set({'products': products});
//     await _firestore
//         .collection('cart')
//         .doc(user.email)
//         .update({'products': []});
//     isCartLoading = false;
//     notifyListeners();
//   }
// }
