import 'package:flutter/material.dart';
import 'package:jarkop_app/Pages/Homescreen/account.dart';
import 'package:jarkop_app/Pages/Homescreen/home.dart';
import 'package:scroll_bottom_navigation_bar/scroll_bottom_navigation_bar.dart';

class Navipage extends StatefulWidget {
  const Navipage({super.key});

  @override
  State<Navipage> createState() => _NavipageState();
}

class _NavipageState extends State<Navipage> {
  final controller = ScrollController();
  int _selectedIndex = 0;

  List _widgetOptions = [
    Dashboard(),
    Text("History"),
    Text("Shop"),
    accountPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar:BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
