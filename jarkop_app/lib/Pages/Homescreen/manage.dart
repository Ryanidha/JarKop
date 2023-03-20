import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
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
                    iconEnabledColor: Colors.white,

                    //Icon color
                  ))),
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
                  )))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
}
