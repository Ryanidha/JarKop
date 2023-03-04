import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jarkop_driver_app/login_register/loginPage.dart';
import 'package:jarkop_driver_app/login_register/registerPage.dart';


class loginRegister extends StatefulWidget {
  const loginRegister({super.key});

  @override
  State<loginRegister> createState() => _loginRegisterState();
}

class _loginRegisterState extends State<loginRegister> {
  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffeacda2),
      body: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Image.asset("images/main.png", width: 250, height: 210),
                ),
                Container(
                    child: const Text(
                  'Driver',
                  style: TextStyle(
                      fontFamily: 'Noto Sans',
                      fontSize: 24,
                      color: Colors.black),
                )),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 80,
                  width: sw,
                  margin: EdgeInsets.only(left: 51, right: 50),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextButton(
                      onPressed: () {
                        Get.to(loginpage());
                      },
                      child: const Text(
                        "MASUK",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Inter'),
                      )),
                ),
                const SizedBox(
                  height: 31,
                ),
                Container(
                  height: 80,
                  width: sw,
                  margin: EdgeInsets.only(left: 51, right: 50),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: TextButton(
                      onPressed: () {
                        Get.to(() => Registerpage());
                      },
                      child: const Text(
                        "DAFTAR",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Inter'),
                      )),
                )
              ])),
    );
  }
}
