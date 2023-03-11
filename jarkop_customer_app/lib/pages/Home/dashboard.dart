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
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 117,
                width: sw,
                color: Color(0xffFFD18D),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 18),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 53),
                                child: Text(
                                  "Deliver to",
                                  style: TextStyle(
                                    fontFamily: 'Noto Sans',
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.only(left: 18),
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
                        Container(
                          padding: EdgeInsets.only(right: 18),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.red[400],
                                size: 35,
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                  left: 30,
                  top: 0,
                  child: Container(
                    height: 63,
                    width: 325,
                    decoration: BoxDecoration(color: Colors.black),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
