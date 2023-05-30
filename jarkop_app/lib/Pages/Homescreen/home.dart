import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:jarkop_app/controllers/orders_controller.dart';

class Dashboard extends StatelessWidget {
Dashboard({super.key});
 final OrdersController ordersController = Get.put(OrdersController());
  @override
  Widget build(BuildContext context) {
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
                      fontFamily: 'NotoSans',
                      fontSize: 14,
                      color: Colors.black),
                ),
                subtitle: Text(
                  "Rp 1.000.000",
                  style: TextStyle(
                      fontFamily: 'NotoSans',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 23,
            ),
            // Container(
            //   height: 60,
            //   padding: EdgeInsets.only(left: 70),
            //   decoration: const BoxDecoration(
            //     color: Colors.red,
            //   ),
            //   child: const Row(
            //     children: [
            //       Icon(
            //         Icons.warning,
            //         color: Colors.white,
            //       ),
            //       Text(
            //         "You Have 2 Orders Left",
            //         style: TextStyle(
            //             fontFamily: 'NotoSans',
            //             fontSize: 20,
            //             fontWeight: FontWeight.bold,
            //             color: Colors.white),
            //       ),
            //     ],
            //   ),
            // ),
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
                          fontFamily: 'NotoSans',
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 19, left: 20),
                    child: const Text(
                      "1x Cappucino",
                      style: TextStyle(
                          fontFamily: 'NotoSans',
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
                            fontFamily: 'NotoSans',
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              height: 60,
              padding: const EdgeInsets.only(left: 70),
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.warning,
                    color: Colors.white,
                  ),
                  Text(
                    "You Have 1 New Order",
                    style: TextStyle(
                        fontFamily: 'NotoSans',
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
                    padding: const EdgeInsets.only(top: 19, left: 20),
                    child: const Text(
                      "1x Cappucino",
                      style: TextStyle(
                          fontFamily: 'NotoSans',
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 19, left: 20),
                    child: const Text(
                      "1x Cappucino",
                      style: TextStyle(
                          fontFamily: 'NotoSans',
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 54,
                    color: const Color(0xffFFD18D),
                    child: TextButton(
                      onPressed: (() {}),
                      child: const Text(
                        "Confirm Delivery",
                        style: TextStyle(
                            fontFamily: 'NotoSans',
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
