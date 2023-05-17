import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:jarkop_customer_app/pages/NavigatorPage/naviPage.dart';

class OrderController extends GetxController {
  final _firestore = FirebaseFirestore.instance;

  Future<void> placeOrder(int total, int qty) async {
    final user = FirebaseAuth.instance.currentUser;
    final email = user!.email;

    CollectionReference order = _firestore.collection('orders');

    try {
      QuerySnapshot<Map<String, dynamic>> ordersSnapshot = await _firestore
          .collection('cart')
          .where('user', isEqualTo: email)
          .get();

      List<Map<String, dynamic>> orders =
          ordersSnapshot.docs.map((doc) => doc.data()).toList();

      await order.add({
        'user': email,
        'orders': orders,
        'qty': qty,
        'totals': total,
      }).then((value) {
        Get.snackbar("Success", "Order Placed!");
        Get.offAll(Navipage());
      });

      print('Item added to cart!');
    } catch (e) {
      print('Error adding item to cart: $e');
    }
  }
}
