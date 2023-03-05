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
        body: ListView(
          children: [
            const SizedBox(
              height: 23,
            ),
            Container(
              height: 72,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: const ListTile(
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
            const SizedBox(
              height: 23,
            ),
            Container(
              height: 60,
              padding: EdgeInsets.only(left: 70),
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.warning,
                    color: Colors.white,
                  ),
                  Text(
                    "You Have 2 Orders Left",
                    style: TextStyle(
                        fontFamily: 'Noto Sans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              height: 150,
              color: Colors.white,
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 19, left: 20),
                    child: const Text(
                      "1x Cappucino",
                      style: TextStyle(
                          fontFamily: 'Noto Sans',
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 19, left: 20),
                    child: const Text(
                      "1x Cappucino",
                      style: TextStyle(
                          fontFamily: 'Noto Sans',
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 54,
                    color: Color(0xffFFD18D),
                    child: TextButton(
                      onPressed: (() {}),
                      child: const Text(
                        "Confirm Delivery",
                        style: TextStyle(
                            fontFamily: 'Noto Sans',
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 60,
              padding: EdgeInsets.only(left: 70),
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.warning,
                    color: Colors.white,
                  ),
                  Text(
                    "You Have 2 Orders Left",
                    style: TextStyle(
                        fontFamily: 'Noto Sans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              height: 150,
              color: Colors.white,
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 19, left: 20),
                    child: const Text(
                      "1x Cappucino",
                      style: TextStyle(
                          fontFamily: 'Noto Sans',
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 19, left: 20),
                    child: const Text(
                      "1x Cappucino",
                      style: TextStyle(
                          fontFamily: 'Noto Sans',
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 54,
                    color: Color(0xffFFD18D),
                    child: TextButton(
                      onPressed: (() {}),
                      child: Text(
                        "Confirm Delivery",
                        style: TextStyle(
                            fontFamily: 'Noto Sans',
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
            
          ],
        ));
  }
}
