import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:jarkop_customer_app/pages/merchant/listPage.dart';
import 'package:jarkop_customer_app/pages/merchant/merchantDetail.dart';
import 'package:jarkop_customer_app/pages/searchPage.dart';
import 'package:jarkop_customer_app/widgets/carousel.dart';

final useremail = FirebaseAuth.instance.currentUser!.email;

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String dropdownvalue = 'FMIPA UGM';

  // List of items in our dropdown menu
  var items = [
    'FMIPA UGM',
    'FK UGM',
    'FISIPOL UGM',
  ];

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 130 + MediaQuery.of(context).viewPadding.top,
                  decoration: BoxDecoration(color: Color(0xffFFD18D)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).viewPadding.top),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 70),
                                child: Text(
                                  "Deliver to",
                                  style: TextStyle(
                                    fontFamily: 'NotoSans',
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Container(
                                  child: DropdownButton(
                                value: dropdownvalue,
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
                                    dropdownvalue = newValue!;
                                  });
                                },
                                // isExpanded: true, //make true to take width of parent widget
                                underline: Container(), //empty line
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: 'NotoSans',
                                    fontWeight: FontWeight.bold),
                                // dropdownColor: Colors.white,
                                iconEnabledColor: Colors.white,

                                //Icon color
                              )),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.red[400],
                                size: 35,
                              )),
                        )
                      ],
                    ),
                  ),
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Container(
                      // padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: TextField(
                                    cursorColor: Colors.grey,
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                            // borderRadius: BorderRadius.circular(10),
                                            borderSide: BorderSide.none),
                                        hintText: 'Search',
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 18),
                                        prefixIcon: IconButton(
                                          icon: Icon(Icons.search),
                                          onPressed: () {
                                            Get.to(() => SeachPage());
                                          },
                                          
                                          ))),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 54,
          width: 315,
          decoration: BoxDecoration(
              color: Color(0xffF5ECE3),
              borderRadius: BorderRadius.circular(5.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(Icons.wallet),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Column(
                        children: [
                          Text(
                            "Balance",
                            style: TextStyle(
                              fontFamily: 'NotoSans',
                            ),
                          ),
                          Text(
                            "100.000",
                            style: TextStyle(
                                fontFamily: 'NotoSans',
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.movie),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10, right: 50),
                      child: Column(
                        children: [
                          Text(
                            "Voucher",
                            style: TextStyle(
                              fontFamily: 'NotoSans',
                            ),
                          ),
                          Text(
                            "100.000",
                            style: TextStyle(
                                fontFamily: 'NotoSans',
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Today’s Promotions",
                          style: TextStyle(
                              fontFamily: 'NotoSans',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  HorizontalCarousel(
                    items: ['Item 1', 'Item 2', 'Item 3', 'Item 4'],
                    height: 155,
                    width: 267,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "Our Recomendations",
                          style: TextStyle(
                              fontFamily: 'NotoSans',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  HorizontalCarousel(
                    items: ['Item 1', 'Item 2', 'Item 3', 'Item 4'],
                    height: 115,
                    width: 114,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Quick Items",
                      style: TextStyle(
                          fontFamily: 'NotoSans',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                      onPressed: () {
                        Get.to(() => ListPage());
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        size: 20,
                      ))
                ],
              ),
              _getWidget()

              // Container(
              //   padding: EdgeInsets.only(left: 29),
              //   child: Row(
              //     children: [
              //       Container(
              //         height: 100,
              //         width: 100,
              //         decoration: BoxDecoration(color: Colors.grey),
              //       ),
              //       Container(
              //         padding: EdgeInsets.only(left: 11),
              //         child: Column(
              //           children: const [
              //             Text(
              //               "Cafe A",
              //               style: TextStyle(
              //                   fontFamily: 'NotoSans',
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 20),
              //             )
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // Container(
              //   padding: EdgeInsets.only(left: 29),
              //   child: Row(
              //     children: [
              //       Container(
              //         height: 100,
              //         width: 100,
              //         decoration: BoxDecoration(color: Colors.grey),
              //       ),
              //       Container(
              //         padding: EdgeInsets.only(left: 11),
              //         child: Column(
              //           children: const [
              //             Text(
              //               "Cafe B",
              //               style: TextStyle(
              //                   fontFamily: 'NotoSans',
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 20),
              //             )
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        )
      ],
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
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
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
                        Container(
                          padding: EdgeInsets.only(left: 11),
                          child: Column(
                            children: [
                              TextButton(
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
