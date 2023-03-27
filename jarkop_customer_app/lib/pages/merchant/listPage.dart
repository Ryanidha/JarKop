import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:jarkop_customer_app/pages/merchant/merchantDetail.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
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
          'Near Me',
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
          children: [_getWidget()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.shopping_cart_outlined,
          color: Colors.black,
        ),
        backgroundColor: Color(0xffF5ECE3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget _getWidget() {
    Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('users')
        .where('account', isEqualTo: 'merchant')
        .snapshots();
    return StreamBuilder<QuerySnapshot<Object?>>(
      stream: _usersStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        if (snapshot.data!.docs.length == 0) {
          return Text('No Data');
        }
        return ListView(
          shrinkWrap: true,
          primary: false,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return Column(
              children: [
                SizedBox(height: 13),
                Container(
                    height: 140,
                    width: 360,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Container(
                          height: 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                margin: EdgeInsets.only(top: 15),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                  // image: DecorationImage(
                                  //   image: NetworkImage(data['image']),
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 12,
                                  ),
                                  TextButton(
                                    // onPressed: (() {
                                    //   Get.to(() => MerchantDetail());
                                    // }),
                                    child: Text(
                                      data['shopname'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'NotoSans',
                                          color: Colors.black),
                                    ),
                                    onPressed: () {
                                      Get.to(() => MerchantDetail(
                                            Merchdata: data['shopname'],
                                          ));
                                    },
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow[700],
                                          size: 20,
                                        ),
                                        Text("4.9"),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("|"),
                                        SizedBox(width: 10),
                                        Text("1.5 km"),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("|"),
                                        SizedBox(width: 10),
                                        Text("10 mins"),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            );
          }).toList(),
        );
      },
    );
  }
}