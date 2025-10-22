import 'package:flutter/material.dart';
import 'package:ppkd_elizsabel/Tugas7/tugas7.dart';
import 'package:ppkd_elizsabel/tugas8/tugas8_1.dart';

class bottomNavBar2 extends StatefulWidget {
  const bottomNavBar2({super.key});

  @override
  State<bottomNavBar2> createState() => _bottomNavBar2();
}
//
class _bottomNavBar2 extends State<bottomNavBar2> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    // Center(child: Text("Home")),
    tugas7DateTime(),
    tugas8_2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          print(index);
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_applications),
            label: "Tentang aplikasi",
          ),
        ],
      ),
    );
  }
}
