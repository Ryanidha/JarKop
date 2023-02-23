import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
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
                        Image.asset("assets/logo.png", width: sw, height: 210),
                  ),
                ])));
  }
}
