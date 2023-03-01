import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class accountPage extends StatefulWidget {
  const accountPage({super.key});

  @override
  State<accountPage> createState() => _accountPageState();
}

class _accountPageState extends State<accountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
              color: Colors.white,
              child: const ListTile(
                leading: Icon(
                  Icons.account_circle,
                  size: 90,
                ),
                title: Text('Kang Dagang'),
              ))
        ],
      ),
    );
  }
}
