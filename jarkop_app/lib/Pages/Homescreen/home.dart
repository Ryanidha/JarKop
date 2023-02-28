import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffEACDA2),
        title: Text(
          "Home",
          style: TextStyle(
              fontFamily: "Inter", fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Color(0xffF5ECE3),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 23,
          ),
          Container(
            width: sw,
            height: 72,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(
            height: 23,
          ),
          Container(
            height: 53,
            width: sw,
            decoration: BoxDecoration(color: Colors.red),
          ),
          ListView(
            
          )
        ],
      ),
    );
  }
}
