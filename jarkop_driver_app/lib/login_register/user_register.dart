import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:jarkop_driver_app/login_register/userPhoto.dart';
import 'package:jarkop_driver_app/naviPage/naviPage.dart';

class userRegister extends StatefulWidget {
  const userRegister({super.key});

  @override
  State<userRegister> createState() => _userRegisterState();
}

class _userRegisterState extends State<userRegister> {
  final _nameController = String;
  final _phoneController = String;
  final _idController = String;
  final _vehicleController=String;
  final _vehiclenameController=String;


  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffeacda2),
      body: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50, top: 80),
        child: SingleChildScrollView(
          child: Column(
            children: [
               Image.asset(
              'images/icon.png',
              width: 100,
              height: 100,
            ),
              Container(
                width: sw * 0.8,
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelStyle: TextStyle(color: Colors.grey),
                      labelText: "Nama"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: sw * 0.8,
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelStyle: TextStyle(color: Colors.grey),
                      labelText: "No.HP"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: sw * 0.8,
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelStyle: TextStyle(color: Colors.grey),
                      labelText: "NIK"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: sw * 0.8,
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelStyle: TextStyle(color: Colors.grey),
                      labelText: "Nama Kendaraan"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: sw * 0.8,
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelStyle: TextStyle(color: Colors.grey),
                      labelText: "No.Kendaraan"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: sw,
                margin: EdgeInsets.only(left: 45, right: 45),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: TextButton(
                  onPressed: (() {
                    // Get.off(UserPhoto());
                    Get.off(()=>Navipage());
                  }),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        color: Color(0xffeacda2),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
