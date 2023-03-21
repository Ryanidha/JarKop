import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:jarkop_app/Pages/services/menuData.dart';
import 'package:jarkop_app/widgets/addMenu.dart';

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
      body: ListView(
        padding: EdgeInsets.only(top: 12),
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
                    isExpanded: true, //make true to take width of parent widget
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
                    isExpanded: true, //make true to take width of parent widget
                    underline: Container(), //empty line
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    dropdownColor: Colors.white,
                    iconEnabledColor: Colors.white,

                    //Icon color
                  ))),
        ],
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
      return FutureBuilder<QuerySnapshot<Object?>>(
        future: _usersStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return Expanded(
            child: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Column(
                  children: [
                    Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.57),
                                blurRadius: 5)
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(data['name']),
                            Text(data['price']),
                          ],
                        ))
                  ],
                );
              }).toList(),
            ),
          );
        },
      );
    } else if (value == 'Makanan') {
      return Scaffold();
    } else if (value == 'Snack') {
      return Scaffold();
    }
    return Placeholder();
  }

}
