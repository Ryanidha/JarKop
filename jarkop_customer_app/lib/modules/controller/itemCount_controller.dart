import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var total = 0.obs;

  increment() {
    total.value++;
  }

  decrement() {
    if (total.value <= 0) {
      Get.snackbar(
        "Buying",
        "Can not be less than 0",
        icon: Icon(Icons.alarm),
        barBlur: 20,
        isDismissible: true,
        duration: Duration(seconds: 3),
      );
    }else{
      total.value--;
    }
    // total.value--;
  }
}
