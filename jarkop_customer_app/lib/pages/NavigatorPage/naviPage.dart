import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:jarkop_customer_app/pages/Home/accountPage.dart';
import 'package:jarkop_customer_app/pages/Home/dashboard.dart';
import 'package:jarkop_customer_app/pages/Home/historyPage.dart';
import 'package:jarkop_customer_app/pages/Home/walletPage.dart';

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
    HistoryPage(),
    WalletPage(),
    AccountPage()
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
      "Wallet",
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
          backgroundColor: Color(0xffEACDA2),
          title: _atPages.elementAt(_selectedIndex)),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
            icon: Icon(Icons.wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Account',
          ),
        ],
        backgroundColor: Color(0xffEACDA2),
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
