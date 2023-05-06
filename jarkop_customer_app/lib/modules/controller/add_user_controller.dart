import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jarkop_customer_app/pages/NavigatorPage/naviPage.dart';

class AddUserController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController birthdateC;
  late TextEditingController phonenumberC;
  late TextEditingController genderC;

  final _firestore = FirebaseFirestore.instance;

  void addUser(String name, String birthdate,String phonenumber, String gender) async {
    CollectionReference users = _firestore.collection('users');
    final user = FirebaseAuth.instance.currentUser;
    final email = user!.email;
    const type = 'user';

    try {
      await users.add({
        'account': type,
        'email': email,
        'name': name,
        'birthdate': birthdate,
        'phonenumber': phonenumber,	
        'gender': gender,
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
    birthdateC = TextEditingController();
    phonenumberC = TextEditingController();
    genderC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameC = TextEditingController();
    birthdateC = TextEditingController();
    phonenumberC = TextEditingController();
    genderC = TextEditingController();
    super.onClose();
  }
}
