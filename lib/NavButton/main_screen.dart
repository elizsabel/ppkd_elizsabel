import 'package:flutter/material.dart';
import 'package:ppkd_elizsabel/tugasflutter/home_screen6.dart';
import 'package:ppkd_elizsabel/tugasflutter/tugas4.dart';
import 'package:ppkd_elizsabel/tugasflutter/tugas5.dart';

class MainScreen1 extends StatefulWidget {
  const MainScreen1({super.key});

  @override
  State<MainScreen1> createState() => _MainScreen1();
}

class _MainScreen1 extends State<MainScreen1> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    // Center(child: Text("Home")),
    HomeScreen(),
    Tugas4MyWidgetDay10(),
    State1Day12(),
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
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "School"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}