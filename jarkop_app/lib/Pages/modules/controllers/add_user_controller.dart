import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jarkop_app/Pages/navipage.dart';

class AddUserController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController idC;
  late TextEditingController phonenumberC;

  final _firestore = FirebaseFirestore.instance;

  void addUser(String name, String id, String phonenumber) async {
    CollectionReference users = _firestore.collection('users');

    try {
      await users.add({
        'name': name,
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
    phonenumberC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    idC.dispose();
    phonenumberC.dispose();
    super.onClose();
  }
}
