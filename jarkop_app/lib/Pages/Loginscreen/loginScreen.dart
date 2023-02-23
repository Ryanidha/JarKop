import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../RegisterScreen/register.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
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
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Image.asset("assets/logo.png", width: 250, height: 210),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 80,
                  width: sw,
                  margin: EdgeInsets.only(left: 51, right: 50),
                  decoration: BoxDecoration(
                      color: Color(0xffeacda2),
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "MASUK",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Inter'),
                      )),
                ),
                SizedBox(
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
                        Get.to(Register());
                      },
                      child: Text(
                        "DAFTAR",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffeacda2),
                            fontFamily: 'Inter'),
                      )),
                )
              ])),
    );
  }
}
