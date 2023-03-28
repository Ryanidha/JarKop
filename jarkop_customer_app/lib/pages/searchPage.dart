import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SeachPage extends StatefulWidget {
  const SeachPage({super.key});

  @override
  State<SeachPage> createState() => _SeachPageState();
}

class _SeachPageState extends State<SeachPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Color(0xffFFD18D),
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {},
                ),
                hintText: 'Search...',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
