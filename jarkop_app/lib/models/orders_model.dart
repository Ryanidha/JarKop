import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersModel {
  String user;
  List orders;
  int totals;
  int qty;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  OrdersModel({
    required this.user,
    required this.orders,
    required this.qty,
    required this.totals,
  });

  factory OrdersModel.fromFirestore(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    return OrdersModel(
        user: data['user'],
        orders: data['orders'],
        qty: data['qty'],
        totals: data['totals'],
        );
  }
}