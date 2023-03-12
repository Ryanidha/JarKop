import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
                                    fontFamily: 'Noto Sans',
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
                                    fontFamily: 'Noto Sans',
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
                                        prefixIcon: Icon(Icons.search))),
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
                              fontFamily: 'Noto Sans',
                            ),
                          ),
                          Text(
                            "100.000",
                            style: TextStyle(
                                fontFamily: 'Noto Sans',
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
                              fontFamily: 'Noto Sans',
                            ),
                          ),
                          Text(
                            "100.000",
                            style: TextStyle(
                                fontFamily: 'Noto Sans',
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
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Today’s Promotions",
                  style: TextStyle(
                      fontFamily: 'Noto Sans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
