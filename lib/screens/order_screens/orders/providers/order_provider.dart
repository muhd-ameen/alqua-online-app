// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class OrderProvider extends ChangeNotifier {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseAuth auth = FirebaseAuth.instance;

//   Stream<DocumentSnapshot> getOrderStream() {
//     final user = auth.currentUser!;
//     return _firestore.collection('orders').doc(user.email).snapshots();
//   }

//   Future<void> removeProductFromOrder(int index, List<dynamic> products) async {
//     final user = auth.currentUser!;
//     products.removeAt(index);
//     await _firestore.collection('orders').doc(user.email).update({
//       'products': products,
//     });
//     notifyListeners();
//   }

//   double calculateTotalPrice(DocumentSnapshot snapshot) {
//     double totalPrice = 0;
//     if (snapshot.data() != null) {
//       Map<String, dynamic> cartData = snapshot.data() as Map<String, dynamic>;
//       List<dynamic> products = cartData['products'] ?? [];
//       for (var product in products) {
//         totalPrice += product['price'] * product['qty'];
//       }
//     }
//     return totalPrice;
//   }
// }
