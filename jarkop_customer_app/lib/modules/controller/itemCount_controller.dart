import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemCartController extends GetxController {
  var total = 0.obs;

  void increment() {
    total.value++;
  }

  void decrement() {
    if (total.value <= 0) {
      Get.snackbar(
        "Buying",
        "Cannot be less than 0",
        icon: Icon(Icons.alarm),
        barBlur: 20,
        isDismissible: true,
        duration: Duration(seconds: 3),
      );
    } else {
      total.value--;
    }
  }
}
