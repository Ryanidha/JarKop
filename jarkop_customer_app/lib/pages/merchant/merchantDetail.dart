import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:jarkop_customer_app/modules/controller/itemCount_controller.dart';

class MerchantDetail extends StatefulWidget {
  final String Merchdata;
  const MerchantDetail({super.key, required this.Merchdata});

  @override
  State<MerchantDetail> createState() => _MerchantDetailState();
}

class _MerchantDetailState extends State<MerchantDetail> {
  final CartController c = Get.put(CartController());
  // int _n = 0;

  // void add() {
  //   setState(() {
  //     _n++;
  //   });
  // }

  // void minus() {
  //   setState(() {
  //     if (_n != 0) _n--;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF5ECE3),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: sw,
              height: 250,
              color: Color(0xffFFD18D),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          )),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    // padding: EdgeInsets.only(left: 29),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 29,
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.Merchdata,
                                style: TextStyle(
                                  fontFamily: 'NotoSans',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            getMerchantDetail(widget.Merchdata),
          ],
        ),
      ),
      // floatingActionButton: Padding(
      //   padding: EdgeInsets.only(bottom: 16.0),
      //   child: SizedBox(
      //     width: 250.0,
      //     child: FloatingActionButton(
      //       backgroundColor: Color(0xffFFD18D),
      //       onPressed: () {},
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(8.0),
      //       ),
      //       child: Text(
      //         "ADD TO CART",
      //         style: TextStyle(
      //             fontFamily: 'NotoSans',
      //             fontSize: 20,
      //             fontWeight: FontWeight.bold,
      //             color: Colors.black),
      //       ),
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getMerchantDetail(shopdata) {
    final sw = MediaQuery.of(context).size.width;
    Stream<QuerySnapshot> _productsStream = FirebaseFirestore.instance
        .collection('products')
        .where('shopname', isEqualTo: shopdata)
        .snapshots();
    return StreamBuilder<QuerySnapshot<Object?>>(
      stream: _productsStream,
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
                  height: 138,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            data['description'],
                            style: TextStyle(
                              fontFamily: 'NotoSans',
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(height: 20),
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
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Container(
                                  width: 80,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xffFFD18D),
                                  ),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Add",
                                      style: TextStyle(
                                        fontFamily: 'NotoSans',
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(right: 10),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //     children: [
                          //       IconButton(
                          //         onPressed: () => c.decrement(),
                          //         icon: Icon(
                          //           Icons.remove,
                          //           size: 14,
                          //         ),
                          //       ),
                          //       Obx(() => Text("${c.total.toString()}")),
                          //       IconButton(
                          //         onPressed: () => c.increment(),
                          //         icon: Icon(
                          //           Icons.add,
                          //           size: 14,
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 121.47,
                        height: 108.26,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                          image: DecorationImage(
                            image: NetworkImage(data['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        );
      },
    );
  }
}
