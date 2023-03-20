import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jarkop_app/Pages/modules/views/add_user_views.dart';

import '../navipage.dart';

class userRegister extends StatefulWidget {
  const userRegister({super.key});

  @override
  State<userRegister> createState() => _userRegisterState();
}

class _userRegisterState extends State<userRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddUserView(),
      // backgroundColor: Color(0xffeacda2),
      // body: Padding(
      //   padding: const EdgeInsets.only(left: 50, right: 50, top: 80),
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         Image.asset(
      //           'assets/icon.png',
      //           width: 100,
      //           height: 100,
      //         ),
      //         Container(
      //           width: sw * 0.8,
      //           padding: const EdgeInsets.only(left: 10),
      //           decoration: BoxDecoration(
      //               color: Colors.white,
      //               borderRadius: BorderRadius.circular(10)),
      //           child: TextFormField(
      //             controller: controller.nameC,
      //             decoration: const InputDecoration(
      //                 border: InputBorder.none,
      //                 labelStyle: TextStyle(color: Colors.grey),
      //                 labelText: "Nama"),
      //           ),
      //         ),
      //         const SizedBox(
      //           height: 20,
      //         ),
      //         Container(
      //           width: sw * 0.8,
      //           padding: const EdgeInsets.only(left: 10),
      //           decoration: BoxDecoration(
      //               color: Colors.white,
      //               borderRadius: BorderRadius.circular(10)),
      //           child: TextFormField(
      //             decoration: const InputDecoration(
      //                 border: InputBorder.none,
      //                 labelStyle: TextStyle(color: Colors.grey),
      //                 labelText: "NIK"),
      //           ),
      //         ),
      //         const SizedBox(
      //           height: 20,
      //         ),
      //         Container(
      //           width: sw * 0.8,
      //           padding: const EdgeInsets.only(left: 10),
      //           decoration: BoxDecoration(
      //               color: Colors.white,
      //               borderRadius: BorderRadius.circular(10)),
      //           child: TextFormField(
      //             decoration: const InputDecoration(
      //                 border: InputBorder.none,
      //                 labelStyle: TextStyle(color: Colors.grey),
      //                 labelText: "Phone Number"),
      //           ),
      //         ),
      //         const SizedBox(
      //           height: 20,
      //         ),
      //         Container(
      //           height: 50,
      //           width: sw,
      //           margin: EdgeInsets.only(left: 45, right: 45),
      //           decoration: BoxDecoration(
      //               color: Colors.white,
      //               borderRadius: BorderRadius.circular(15)),
      //           child: TextButton(
      //             onPressed: (() {
      //               // Get.off(UserPhoto());
      //               Get.offAll(() => Navipage());
      //             }),
      //             child: Text(
      //               "Continue",
      //               style: TextStyle(
      //                   fontFamily: 'NotoSans',
      //                   fontSize: 18,
      //                   color: Color(0xffeacda2),
      //                   fontWeight: FontWeight.bold),
      //             ),
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
