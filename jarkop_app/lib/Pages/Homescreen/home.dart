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
    // final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF5ECE3),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 23,
            ),
            Container(
              height: 72,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(
                  Icons.wallet,
                  color: Colors.black,
                ),
                title: Text(
                  "Balance",
                  style: TextStyle(
                      fontFamily: 'Noto Sans',
                      fontSize: 14,
                      color: Colors.black),
                ),
                subtitle: Text(
                  "Rp 1.000.000",
                  style: TextStyle(
                      fontFamily: 'Noto Sans',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 23,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: ListTile(
                leading: Icon(
                  Icons.warning,
                  color: Colors.white,
                ),
                title: Text(
                  "You Have 2 Orders Left",
                  style: TextStyle(
                      fontFamily: 'Noto Sans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            Container(
              height: 152,
              decoration: BoxDecoration(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
