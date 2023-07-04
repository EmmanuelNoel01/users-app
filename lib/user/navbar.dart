// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:health_api_and_mobile_application/settings.dart';

import 'home.dart';

class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  final tabs = [
    Home(),
    SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F3),
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedFontSize: 20,
        unselectedFontSize: 20,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        iconSize: 50,
      ),
    );
  }
}
