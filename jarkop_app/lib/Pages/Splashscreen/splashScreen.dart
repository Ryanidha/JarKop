import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Loginscreen/loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () => Get.to(loginScreen()));
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
              'assets/icon.png',
              width: 258.66,
              height: 258.66,
            )
          ],
        ),
      ),
    );
  }
}
