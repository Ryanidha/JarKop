import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jarkop_driver_app/home/order.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF5ECE3),
      body: ListView(
        children: [
          SizedBox(
            height: 23,
          ),
          Container(
              height: 72,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                  contentPadding: EdgeInsets.all(8),
                  leading: Icon(
                    Icons.account_circle_rounded,
                    color: Colors.black,
                    size: 50,
                  ),
                  trailing: Switch(
                      activeColor: Colors.green,
                      inactiveTrackColor: Colors.red,
                      inactiveThumbColor: Colors.red,
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = !isSwitched;
                        });
                      }),
                  title: Text(
                    "Mr John Doe",
                    style: TextStyle(fontFamily: 'Noto Sans', fontSize: 14),
                  ),
                  subtitle: isSwitched
                      ? Text(
                          "ACTIVE",
                          style: TextStyle(
                              fontFamily: 'Noto Sans',
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontSize: 18),
                        )
                      : Text(
                          "INACTIVE",
                          style: TextStyle(
                              fontFamily: 'Noto Sans',
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                              fontSize: 18),
                        ))),
          SizedBox(
            height: 10,
          ),
          !isSwitched
              ? Container(
                  height: 500,
                  width: 360,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 60),
                        Icon(
                          Icons.warning,
                          size: 150,
                          color: Colors.red,
                        ),
                        Text(
                          "PLEASE SET STATUS TO",
                          style: TextStyle(
                              fontFamily: 'Noto Sans',
                              fontSize: 24,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "ACTIVE TO START",
                          style: TextStyle(
                              fontFamily: 'Noto Sans',
                              fontSize: 24,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "RECIEVING ORDER",
                          style: TextStyle(
                              fontFamily: 'Noto Sans',
                              fontSize: 24,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        padding: EdgeInsets.only(left: 110),
                        decoration: const BoxDecoration(
                          color: Color(0xffFFD600),
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.warning,
                              color: Colors.white,
                            ),
                            Text(
                              "Incoming Order",
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
                        width: sw,
                        height: 225,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(
                                Icons.store,
                                size: 40,
                              ),
                              title: Text(
                                "Warung Kopi A",
                                style: TextStyle(
                                    fontFamily: 'Noto Sans',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text("Jl. Antah Berantah No. 12",
                                  style: TextStyle(
                                    fontFamily: 'Noto Sans',
                                    fontSize: 12,
                                  )),
                              trailing: Wrap(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.message,
                                        size: 30,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.phone,
                                        size: 30,
                                      )),
                                ],
                              ),
                            ),
                            ListTile(
                              leading: Icon(
                                Icons.location_on,
                                size: 40,
                              ),
                              title: Text(
                                "John Doe",
                                style: TextStyle(
                                    fontFamily: 'Noto Sans',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text("Jl. Kemana Aja Ok No. 10",
                                  style: TextStyle(
                                    fontFamily: 'Noto Sans',
                                    fontSize: 12,
                                  )),
                              trailing: Wrap(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.message,
                                        size: 30,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.phone,
                                        size: 30,
                                      )),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Colors.black,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                    padding: EdgeInsets.only(left: 20),
                                    child: const Text(
                                      "Total Payment",
                                      style: TextStyle(
                                          fontFamily: 'Noto Sans',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    )),
                                const Spacer(),
                                Container(
                                    padding: EdgeInsets.only(right: 20),
                                    child: const Text("50.000",
                                        style: TextStyle(
                                            fontFamily: 'Noto Sans',
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold))),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                          height: 54,
                          width: sw,
                          color: Color(0xffFFD18D),
                          child: TextButton(
                              onPressed: (() {
                                Get.to(()=>OrderPage());
                              }),
                              child: const Text(
                                "Accept Order",
                                style: TextStyle(
                                    fontFamily: 'Noto Sans',
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )))
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
