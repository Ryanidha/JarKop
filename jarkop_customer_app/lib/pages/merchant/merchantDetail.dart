import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MerchantDetail extends StatefulWidget {
  final String Merchdata;
  const MerchantDetail({super.key, required this.Merchdata});

  @override
  State<MerchantDetail> createState() => _MerchantDetailState();
}

class _MerchantDetailState extends State<MerchantDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5ECE3),
      body: getMerchantDetail(widget.Merchdata),
    );
  }

  Widget getMerchantDetail(shopdata) {
    final sw = MediaQuery.of(context).size.width;
    Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('users')
        .where('shopname', isEqualTo: shopdata)
        .snapshots();
    return StreamBuilder<QuerySnapshot<Object?>>(
      stream: _usersStream,
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
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'Loading',
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
        return SingleChildScrollView(
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
                              children: [Text("Dummy")],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}