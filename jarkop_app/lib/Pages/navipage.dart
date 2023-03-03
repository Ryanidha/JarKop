import 'package:flutter/material.dart';
import 'package:jarkop_app/Pages/Homescreen/account.dart';
import 'package:jarkop_app/Pages/Homescreen/history.dart';
import 'package:jarkop_app/Pages/Homescreen/home.dart';
import 'package:jarkop_app/Pages/Homescreen/manage.dart';
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
    historyPage(),
    StorePage(),
    accountPage()
  ];

  List _atPages = [
    Text(
      "Home",
      style: TextStyle(color: Colors.black, fontFamily: 'Noto Sans'),
    ),
    Text(
      "History",
      style: TextStyle(color: Colors.black, fontFamily: 'Noto Sans'),
    ),
    Text(
      "Store",
      style: TextStyle(color: Colors.black, fontFamily: 'Noto Sans'),
    ),
    Text(
      "Account",
      style: TextStyle(color: Colors.black, fontFamily: 'Noto Sans'),
    )
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
          backgroundColor: Colors.white,
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
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store_mall_directory_rounded),
            label: 'Manage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Account',
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
