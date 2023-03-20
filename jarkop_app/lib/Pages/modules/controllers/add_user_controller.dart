import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jarkop_app/Pages/navipage.dart';

class AddUserController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController idC;
  late TextEditingController phonenumberC;
  late TextEditingController shopnameC;

  final _firestore = FirebaseFirestore.instance;

  void addUser(
      String name, String id, String shopname, String phonenumber) async {
    CollectionReference users = _firestore.collection('users');
    final user = FirebaseAuth.instance.currentUser;
    final email = user!.email;

    try {
      await users.add({
        'email': email,
        'name': name,
        'shopname': shopname,
        'NIK': id,
        'phonenumber': phonenumber,
      }).then((value) => Get.off(Navipage()));
    } catch (e) {
      print(e);
      Get.defaultDialog(
          title: 'Error', middleText: e.toString(), textConfirm: 'OK');
    }
  }

  @override
  void onInit() {
    nameC = TextEditingController();
    idC = TextEditingController();
    shopnameC = TextEditingController();
    phonenumberC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    shopnameC.dispose();
    idC.dispose();
    phonenumberC.dispose();
    super.onClose();
  }
}
