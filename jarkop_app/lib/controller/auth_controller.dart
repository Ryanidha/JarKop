import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../Pages/navipage.dart';

class LoginController {
  const LoginController({required this.email, required this.password, required this.auth});

  final email;
  final password;
  final auth;
  Future<void> loginSubmit() async {
    try {
      await auth
          .signInWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) => Get.offAll(() => Navipage()));
    } catch (e) {
      print(e);
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  void dispose() {
    email.dispose();
    email.dispose();
  }
}
