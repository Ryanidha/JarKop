import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
    final _firestore = FirebaseFirestore.instance;
   Future<void> placeOrder( int total,int qty ) async {
    
    final user = FirebaseAuth.instance.currentUser;
    final email = user!.email;
    CollectionReference order = _firestore.collection('orders');
    Future<QuerySnapshot<Map<String, dynamic>>> orders = _firestore.collection('cart').where('user',isEqualTo: email).get();
    try {
      await order.add({
        'user': email,
        'orders':await orders,
        'qty': qty,
        'totals': total,
      });
      print('Item added to cart!');
    } catch (e) {
      print('Error adding item to cart: $e');
    }
  }
}