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
    );
  }
}
