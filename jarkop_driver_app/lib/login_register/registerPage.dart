import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:jarkop_driver_app/naviPage/naviPage.dart';


class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  var _passwordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  registerSubmit() async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
              email: _emailController.text.toString().trim(),
              password: _passwordController.text)
          .then((value) => Get.offAll(() => Navipage()));

      addUserDetails(
        _nameController.text.trim(),
        int.parse(_phoneController.text.trim()),
        _emailController.text.trim(),
      );
    } catch (e) {
      print(e);
      SnackBar(content: Text(e.toString()));
    }
  }

  Future addUserDetails(String Nama, int Phone, String Email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'Nama': Nama,
      'Phone': Phone,
      'Email': Email,
    });
  }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xffeacda2),
        body: Padding(
            padding: EdgeInsets.all(50),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Image.asset("images/mainlogo.png", width: sw, height: 152),
                  ),
                  const Text(
                    'Driver',
                    style: TextStyle(
                        fontFamily: 'Noto Sans',
                        fontSize: 24,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: sw,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: _phoneController,
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          labelStyle: TextStyle(color: Colors.grey),
                          labelText: "No.HP"),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: sw,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          labelStyle: TextStyle(color: Colors.grey),
                          labelText: "Email"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: sw,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: !_passwordVisible,
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        labelStyle: TextStyle(color: Colors.grey),
                        labelText: "Password",
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
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
                        registerSubmit();
                      }),
                      child: Text(
                        "DAFTAR",
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
            )));
  }
}
