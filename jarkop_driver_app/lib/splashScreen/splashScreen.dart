import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jarkop_driver_app/login_register/loginRegister.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () => Get.to(loginRegister()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffd18d),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'images/applogo.png',
              width: 258.66,
              height: 258.66,
            )
          ],
        ),
      ),
    );
  }
}