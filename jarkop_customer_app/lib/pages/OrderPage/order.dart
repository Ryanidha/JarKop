import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jarkop_customer_app/widgets/orderlist.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF5ECE3),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Color(0xffFFD18D),
          title: Text(
            'Cart',
            style: TextStyle(
              fontFamily: 'NotoSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [orderList()],
          ),
        ));
  }
}
