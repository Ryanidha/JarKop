import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Navipage extends StatefulWidget {
  const Navipage({super.key});

  @override
  State<Navipage> createState() => _NavipageState();
}

class _NavipageState extends State<Navipage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Halo"),
      ),
    );
  }
}