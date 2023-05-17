import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  Map orders;
  int qty;
  int totals;
  String user;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  OrderModel(
      {required this.orders,
      required this.qty,
      required this.totals,
      required this.user});

  factory OrderModel.fromFirestore(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    return OrderModel(
        orders: data['orders'],
        qty: data['qty'],
        totals: data['totals'],
        user: data['user']);
  }
}
