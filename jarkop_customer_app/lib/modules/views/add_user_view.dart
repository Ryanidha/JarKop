import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jarkop_customer_app/modules/controller/add_user_controller.dart';



class AddUserView extends GetView<AddUserController> {
  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    Get.put(AddUserController());
    return Scaffold(
      backgroundColor: Color(0xffeacda2),
      body: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50, top: 80),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/icon.png',
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
                  controller: controller.nameC,
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
                  controller: controller.birthdateC,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelStyle: TextStyle(color: Colors.grey),
                      labelText: "Tanggal Lahir (dd/mm/yyyy)"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                    width: sw,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: controller.phonenumberC,
                      decoration: new InputDecoration(
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
                  controller: controller.genderC,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelStyle: TextStyle(color: Colors.grey),
                      labelText: "Jenis Kelamin"),
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
                    controller.addUser(
                      controller.nameC.text,
                      controller.birthdateC.text,
                      controller.phonenumberC.text,
                      controller.genderC.text,
                    );
                  }),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                        fontFamily: 'NotoSans',
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
