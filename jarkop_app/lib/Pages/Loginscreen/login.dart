import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:jarkop_app/Pages/Homescreen/home.dart';

import '../navipage.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  var _passwordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  loginSubmit() async {
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((value) => Get.offAll(() => Navipage()));
    } catch (e) {
      print(e);
      SnackBar(content: Text(e.toString()));
    }
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
                        Image.asset("assets/logo.png", width: sw, height: 100),
                  ),
                  Container(
                    child: const Text(
                  'Merchant',
                  style: TextStyle(
                      fontFamily: 'Noto Sans',
                      fontSize: 24,
                      color: Colors.black),
                )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: sw,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: new InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(fontFamily: 'Noto Sans'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: sw,
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: new TextStyle(
                            fontFamily: 'Noto Sans',
                        ),
                        border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
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
                        loginSubmit();
                        
                      }),
                      child: Text(
                        "MASUK",
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
