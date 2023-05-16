import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:jarkop_customer_app/models/cart_model.dart';

class CartController extends GetxController {
   final _db = FirebaseFirestore.instance;
  late TextEditingController nameC;
  late TextEditingController qtyC;
  late TextEditingController priceC;
  final _firestore = FirebaseFirestore.instance;
  RxList<CartModel> orderList = RxList<CartModel>([]);

  List<CartModel> get orders => orderList.value;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    nameC = TextEditingController();
    qtyC = TextEditingController();
    priceC = TextEditingController();
    fetchOrders();
    super.onInit();
  }

  void setOrderList(CartModel order) {
    orderList.add(order);
    update();
  }

  Future<void> fetchOrders() async {
    try {
      isLoading(true);
      update();
      final String user = FirebaseAuth.instance.currentUser!.uid;
      final response =
          await _db.collection('orders').where('user', isEqualTo: user).get();
      final List<CartModel> loadedOrders = [];
      response.docs.forEach((order) {
        loadedOrders.add(CartModel.fromFirestore(order));
      });
      orderList.value = loadedOrders;
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
      update();
    }
  }

  Stream<List<CartModel>> getOrders() {
    final String user = FirebaseAuth.instance.currentUser!.uid;
    return _db
        .collection('orders')
        .where('user', isEqualTo: user)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => CartModel.fromFirestore(doc)).toList());
  }
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
