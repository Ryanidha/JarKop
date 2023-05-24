import 'package:flutter/material.dart';

class MySwitch extends StatefulWidget {
  final bool initialValue;

  const MySwitch({required this.initialValue});

  @override
  _MySwitchState createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool _switchValue = false;

  @override
  void initState() {
    super.initState();
    _switchValue = widget.initialValue;
  }

  void _toggleSwitch(bool value) {
    setState(() {
      _switchValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: Colors.green,
      inactiveTrackColor: Colors.red,
      inactiveThumbColor: Colors.red,
      value: _switchValue,
      onChanged: _toggleSwitch,
    );
  }
}
