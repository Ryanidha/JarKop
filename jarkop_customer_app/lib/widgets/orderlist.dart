import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../modules/controller/itemCount_controller.dart';

class orderList extends StatelessWidget {
  orderList({super.key});
  final c = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final user = FirebaseAuth.instance.currentUser;
    final email = user!.email;
    Stream<QuerySnapshot> _orderStream = FirebaseFirestore.instance
        .collection('cart')
        .where('user', isEqualTo: email)
        .snapshots();
    return StreamBuilder<QuerySnapshot<Object?>>(
        stream: _orderStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'Error',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.data!.docs.length == 0) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'NO DATA',
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          }
          return Column(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: sw,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 30),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['name'],
                              style: TextStyle(
                                fontFamily: 'NotoSans',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              data['price'],
                              style: TextStyle(
                                fontFamily: 'NotoSans',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: () => c.decrement(),
                                    icon: Icon(
                                      Icons.remove,
                                      size: 14,
                                    ),
                                  ),
                                  Obx(() => Text("${c.total.toString()}")),
                                  IconButton(
                                    onPressed: () => c.increment(),
                                    icon: Icon(
                                      Icons.add,
                                      size: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              );
            }).toList(),
          );
        });
  }
}
