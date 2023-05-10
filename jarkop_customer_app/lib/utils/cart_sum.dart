import 'package:cloud_firestore/cloud_firestore.dart';

class CartSum {
   final double totalPrice;

  CartSum({required this.totalPrice});

  factory CartSum.fromFirestore(QuerySnapshot snapshot) {
    double totalPrice = 0.0;
    snapshot.docs.forEach((doc) {
      double itemPrice = doc['price'];
      int itemQuantity = doc['quantity'];
      totalPrice += itemPrice * itemQuantity;
    });
     return CartSum(totalPrice: totalPrice);
  }
}