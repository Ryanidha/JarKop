import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jarkop_customer_app/modules/controller/itemCount_controller.dart';
import 'package:jarkop_customer_app/modules/controller/order_controller.dart';
import 'package:jarkop_customer_app/widgets/orderlist.dart';
import 'package:jarkop_customer_app/widgets/payment_card.dart';

class CartView extends StatelessWidget {
  final OrderController orderController = Get.put(OrderController());
  final ItemCartController Itemcart = Get.put(ItemCartController());
  CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
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
          children: [
            Container(
              width: sw,
              height: 76.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      width: 48.39,
                      height: 48.39,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      )),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Delivery",
                          style: TextStyle(
                            fontFamily: 'NotoSans',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "in 14 minutes",
                          style: TextStyle(
                            fontFamily: 'NotoSans',
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            OrderList(),
            SizedBox(
              height: 10,
            ),
            PaymentCard(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: sw,
        height: 110,
        decoration: BoxDecoration(
          color: Color(0xffEACDA2),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              child: Row(children: [
                Container(
                  width: 35.68,
                  height: 35.68,
                  // padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(Icons.wallet),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Wallet",
                        style: TextStyle(
                          fontFamily: 'NotoSans',
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        "200.000",
                        style: TextStyle(
                            fontFamily: 'NotoSans',
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.change_circle,
                  color: Colors.white,
                  size: 35,
                )
              ]),
            ),
            TextButton(onPressed: (){
              orderController.placeOrder(20000,Itemcart.total.value,);
            }, child: Container(
              width: 340.57,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                  child: Text(
                "Place Delivery Order",
                style: TextStyle(
                  fontFamily: 'NotoSans',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ) )
           
          ],
        ),
      ),
    );
  }
}
