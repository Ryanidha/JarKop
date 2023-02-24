import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
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
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: sw,
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: 'No.HP',
                        hintStyle: new TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 3),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: sw,
                    child: TextField(
                      decoration: new InputDecoration(
                        hintText: 'Password',
                        hintStyle: new TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 3),
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
                      onPressed: (() {}),
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
