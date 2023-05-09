import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CartItem {
  static Future<void> addToCart(String name, int price) async {
     final user = FirebaseAuth.instance.currentUser;
    final email = user!.email;
    try {
      await FirebaseFirestore.instance.collection('cart').add({
        'user': email,
        'name': name,
        'price': price,
      });
      print('Item added to cart!');
    } catch (e) {
      print('Error adding item to cart: $e');
    }
  }
}
