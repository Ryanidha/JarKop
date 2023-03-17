import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffEACDA2),
          title: Text(
            'History',
            style: TextStyle(
              fontFamily: 'NotoSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.only(top: 19, left: 11),
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    height: 81,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    // padding: EdgeInsets.only(left: 10),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          child: Text("Cafe A",
                              style: TextStyle(
                                  fontFamily: 'NotoSans',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "10 Feb 2023, 10:10",
                            style: TextStyle(
                                fontFamily: 'NotoSans',
                                fontSize: 10,
                                color: Colors.grey),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "1 Kopi A, 1 Kopi B, 2 Snack A, 1 Snack B",
                            style: TextStyle(
                                fontFamily: 'NotoSans',
                                fontSize: 10,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "50.000 Completed",
                            style: TextStyle(
                                fontFamily: 'NotoSans',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    height: 81,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    // padding: EdgeInsets.only(left: 10),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          child: Text("Cafe B",
                              style: TextStyle(
                                  fontFamily: 'NotoSans',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "10 Feb 2023, 10:10",
                            style: TextStyle(
                                fontFamily: 'NotoSans',
                                fontSize: 10,
                                color: Colors.grey),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "1 Kopi A, 1 Kopi B, 2 Snack A, 1 Snack B",
                            style: TextStyle(
                                fontFamily: 'NotoSans',
                                fontSize: 10,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "50.000 Completed",
                            style: TextStyle(
                                fontFamily: 'NotoSans',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
