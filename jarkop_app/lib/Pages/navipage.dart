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

  List _atPages = [
    Text("Home"),
    Text("History"),
    Text("Store"),
    Text("Account")
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xffEACDA2),
          title: _atPages.elementAt(_selectedIndex)),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_edu),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store_mall_directory_rounded),
            label: 'Manage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'School',
          ),
        ],
        backgroundColor: Color(0xffEACDA2),
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
