// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:alqua_online/screens/home/provider/home_screen_provider.dart';

class LiveCartPage extends StatefulWidget {
  const LiveCartPage({
    super.key,
  });

  @override
  _LiveCartPageState createState() => _LiveCartPageState();
}

class _LiveCartPageState extends State<LiveCartPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add functionality to add items to the cart
          _firestore.collection('cart').doc(firebaseUserNumber).update({
            'products': FieldValue.arrayUnion([
              {
                'name': 'Product Names',
                'image': 'https://via.placeholder.com/150',
                'qty': 1,
                'productId': '0'
              },
              {
                'name': 'Product Naes',
                'image': 'https://via.placeholder.com/150',
                'qty': 1,
                'productId': '1',
              },
              {
                'name': 'Product Naes',
                'image': 'https://via.placeholder.com/150',
                'qty': 3,
                'productId': '2',
              }
            ])
          });
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: StreamBuilder(
        stream:
            _firestore.collection('cart').doc(firebaseUserNumber).snapshots(),
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
            itemBuilder: (context, index) {
              return ListTile(
                  leading: Image.network(products[index]['image']),
                  title: Text(products[index]['name']),
                  subtitle: Text('Quantity: ${products[index]['qty']}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // delete functionality
                      products.removeAt(index);
                      _firestore
                          .collection('cart')
                          .doc(firebaseUserNumber)
                          .update({'products': products});
                    },
                  )
                  // Add Edit and Delete functionality here
                  );
            },
          );
        },
      ),
    );
  }
}

// Implement functions to add, edit, and delete items from the cart
