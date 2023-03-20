import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jarkop_app/Pages/navipage.dart';

class AddProductController extends GetxController {
  final _firestore = FirebaseFirestore.instance;

  void addProduct(String name, int price, String description) async {
    CollectionReference products = _firestore.collection('products');

    try {
      await products.add({
      'name': name,
      'price': price,
      'description': description,
    }).then((value) => Get.off(Navipage()));

    } catch (e) {
      print(e);
      Get.defaultDialog(
          title: 'Error', middleText: e.toString(), textConfirm: 'OK'
      );
    }
   
  }
}
