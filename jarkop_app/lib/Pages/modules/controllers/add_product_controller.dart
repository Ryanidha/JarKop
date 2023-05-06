import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jarkop_app/Pages/Homescreen/manage.dart';
import 'package:jarkop_app/Pages/navipage.dart';

class AddProductController extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  late TextEditingController nameC;
  late TextEditingController priceC;
  late TextEditingController descriptionC;
  late TextEditingController typesC;

  void addProduct(String name, int price, String description, String types,
      String url) async {
    CollectionReference products = _firestore.collection('products');
    final user = FirebaseAuth.instance.currentUser;
    final email = user!.email;

    try {
      await products.add({
        'email': email,
        'name': name,
        'price': price,
        'description': description,
        'types': types,
        'image': url,
      }).then((value) => Get.back());
    } catch (e) {
      print(e);
      Get.defaultDialog(
          title: 'Error', middleText: e.toString(), textConfirm: 'OK');
    }
  }

  @override
  void onInit() {
    nameC = TextEditingController();
    priceC = TextEditingController();
    descriptionC = TextEditingController();
    typesC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    priceC.dispose();
    descriptionC.dispose();
    typesC.dispose();
    super.onClose();
  }
}
