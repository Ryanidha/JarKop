import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../navipage.dart';

class LoginController {
  const LoginController({required this.emailController, required this.passwordController, required this.authController});

  final emailController;
  final passwordController;
  final authController;
  Future<void> loginSubmit() async {
    try {
      await authController
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) => Get.offAll(() => Navipage()));
    } catch (e) {
      print(e);
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

 
}
