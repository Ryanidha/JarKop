import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 144.31,
      width: 349.07,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Payment Summary",
              style: TextStyle(
                fontFamily: 'NotoSans',
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    "Price",
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      fontSize: 12,
                    ),
                  ),
                  Spacer(),
                  Text("100.000",
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontSize: 12,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    "Delivery fee",
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      fontSize: 12,
                    ),
                  ),
                  Spacer(),
                  Text("5.000",
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontSize: 12,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    "Service and other fees",
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      fontSize: 12,
                    ),
                  ),
                  Spacer(),
                  Text("2.000",
                      style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontSize: 12,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    "Total payment",
                    style: TextStyle(
                        fontFamily: 'NotoSans',
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text("107.000",
                      style: TextStyle(
                          fontFamily: 'NotoSans',
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
