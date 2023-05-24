import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  String user;
  String nama;
  int price;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  CartModel(
      {required this.user,
      required this.nama,
      required this.price,
      });

  factory CartModel.fromFirestore(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    return CartModel(
        user: data['user'],        
        nama: data['nama'],
        price: data['price'],
    );
  }
}
