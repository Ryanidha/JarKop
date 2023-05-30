import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jarkop_app/Pages/modules/models/order_model.dart';

class OrderController extends GetxController {
  final _db = FirebaseFirestore.instance;
  final _firestore = FirebaseFirestore.instance;
  RxList<OrderModel> orderList = RxList<OrderModel>([]);

  List<OrderModel> get orders => orderList.value;
  RxBool isLoading = false.obs;
  var sumPrice = 0;
  @override
  void onInit() {
    fetchOrders();
    super.onInit();
    // totalPrice.value = totalPriceGetter;
    // ever(orderList, (_) => totalPrice.value = totalPriceGetter);
  }

  void setOrderList(OrderModel order) {
    orderList.add(order);
    update();
  }

  Future<void> fetchOrders() async {
    try {
      isLoading(true);
      update();
      final response =
          await _db.collection('orders').get();
      final List<OrderModel> loadedOrders = [];
      response.docs.forEach((order) {
        loadedOrders.add(OrderModel.fromFirestore(order));
      });
      orderList.value = loadedOrders;
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
      update();
    }
  }

  Stream<List<OrderModel>> getOrders() {
    final String user = FirebaseAuth.instance.currentUser!.uid;
    return _db
        .collection('orders')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => OrderModel.fromFirestore(doc)).toList());
  }

  
  //sum total price from cart


  //set change money

  @override
  void onClose() {
    super.onClose();
  }
}
