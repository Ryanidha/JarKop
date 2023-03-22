import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:jarkop_app/widgets/addMenu.dart';
import 'package:jarkop_app/widgets/editMenu.dart';

final useremail = FirebaseAuth.instance.currentUser!.email;

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final Future<QuerySnapshot<Object?>> _usersStream = FirebaseFirestore.instance
      .collection('Products')
      .where('email', isEqualTo: useremail)
      .get();
  String dropdownvalue1 = 'Kopi';
  String dropdownvalue2 = 'Kopi';

  // List of items in our dropdown menu
  var items = [
    'Kopi',
    'Makanan',
    'Snack',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5ECE3),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color:
                              Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                          blurRadius: 5) //blur radius of shadow
                    ]),
                child: Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: DropdownButton(
                      value: dropdownvalue1,
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue1 = newValue!;
                        });
                      },
                      isExpanded:
                          true, //make true to take width of parent widget
                      underline: Container(), //empty line
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      dropdownColor: Colors.white,
                      iconEnabledColor: Colors.white, //Icon color
                    ))),
            _getWidget(dropdownvalue1),
            SizedBox(
              height: 25,
            ),
            DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color:
                              Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                          blurRadius: 5) //blur radius of shadow
                    ]),
                child: Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: DropdownButton(
                      value: dropdownvalue2,
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue2 = newValue!;
                        });
                      },
                      isExpanded:
                          true, //make true to take width of parent widget
                      underline: Container(), //empty line
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      dropdownColor: Colors.white,
                      iconEnabledColor: Colors.white,

                      //Icon color
                    ))),
            _getWidget(dropdownvalue2),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddMenu());
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Color(0xffF5ECE3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget _getWidget(value) {
    if (value == 'Kopi') {
      Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
          .collection('products')
          .where('email', isEqualTo: '${useremail}')
          .where('types', isEqualTo: 'Kopi')
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
                      // padding: EdgeInsets.only(top: 10, bottom: 10),
                      height: 140,
                      width: 360,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  height: 112,
                                  width: 108,
                                  margin: EdgeInsets.only(top: 15),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(data['image']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      data['name'],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'NotoSans'),
                                    ),
                                    Text(
                                      data['price'],
                                      style: TextStyle(
                                          fontSize: 14, fontFamily: 'NotoSans'),
                                    ),
                                    Text(
                                      data['description'],
                                      style: TextStyle(
                                          fontSize: 14, fontFamily: 'NotoSans'),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 123,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 56,
                                            decoration: BoxDecoration(
                                                color: Color(0xffFFD18D),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: TextButton(
                                              onPressed: (() {
                                                Get.to(EditMenu());
                                              }),
                                              child: Text(
                                                "Edit",
                                                style: TextStyle(
                                                    fontFamily: 'NotoSans',
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            height: 30,
                                            width: 56,
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: TextButton(
                                              onPressed: (() {}),
                                              child: Text(
                                                "Disable",
                                                style: TextStyle(
                                                    fontFamily: 'NotoSans',
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
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
    } else if (value == 'Makanan') {
      Future<QuerySnapshot<Object?>> _usersStream = FirebaseFirestore.instance
          .collection('products')
          .where('email', isEqualTo: '${useremail}')
          .where('types', isEqualTo: 'Makanan')
          .get();
      return FutureBuilder<QuerySnapshot<Object?>>(
        future: _usersStream,
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
                      // padding: EdgeInsets.only(top: 10, bottom: 10),
                      height: 140,
                      width: 360,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  height: 112,
                                  width: 108,
                                  margin: EdgeInsets.only(top: 15),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(data['image']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      data['name'],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'NotoSans'),
                                    ),
                                    Text(
                                      data['price'],
                                      style: TextStyle(
                                          fontSize: 14, fontFamily: 'NotoSans'),
                                    ),
                                    Text(
                                      data['description'],
                                      style: TextStyle(
                                          fontSize: 14, fontFamily: 'NotoSans'),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 123,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 56,
                                            decoration: BoxDecoration(
                                                color: Color(0xffFFD18D),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: TextButton(
                                              onPressed: (() {
                                                Get.to(EditMenu());
                                              }),
                                              child: Text(
                                                "Edit",
                                                style: TextStyle(
                                                    fontFamily: 'NotoSans',
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            height: 30,
                                            width: 56,
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: TextButton(
                                              onPressed: (() {}),
                                              child: Text(
                                                "Disable",
                                                style: TextStyle(
                                                    fontFamily: 'NotoSans',
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
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
    } else if (value == 'Snack') {
      Future<QuerySnapshot<Object?>> _usersStream = FirebaseFirestore.instance
          .collection('products')
          .where('email', isEqualTo: '${useremail}')
          .where('types', isEqualTo: 'Snack')
          .get();
      return FutureBuilder<QuerySnapshot<Object?>>(
        future: _usersStream,
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
                      // padding: EdgeInsets.only(top: 10, bottom: 10),
                      height: 140,
                      width: 360,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  height: 112,
                                  width: 108,
                                  margin: EdgeInsets.only(top: 15),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(data['image']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      data['name'],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'NotoSans'),
                                    ),
                                    Text(
                                      data['price'],
                                      style: TextStyle(
                                          fontSize: 14, fontFamily: 'NotoSans'),
                                    ),
                                    Text(
                                      data['description'],
                                      style: TextStyle(
                                          fontSize: 14, fontFamily: 'NotoSans'),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 123,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 56,
                                            decoration: BoxDecoration(
                                                color: Color(0xffFFD18D),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: TextButton(
                                              onPressed: (() {}),
                                              child: Text(
                                                "Edit",
                                                style: TextStyle(
                                                    fontFamily: 'NotoSans',
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            height: 30,
                                            width: 56,
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: TextButton(
                                              onPressed: (() {}),
                                              child: Text(
                                                "Disable",
                                                style: TextStyle(
                                                    fontFamily: 'NotoSans',
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
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
    return Placeholder();
  }
}
