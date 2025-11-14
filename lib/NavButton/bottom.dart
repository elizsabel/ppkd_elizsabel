import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ppkd_elizsabel/NavButton/drawer.dart';
import 'package:ppkd_elizsabel/tugasflutter/appcolor.dart';
import 'package:ppkd_elizsabel/tugasflutter/tugas4.dart';
import 'package:ppkd_elizsabel/tugasflutter/tugas5.dart';

class BottomNav1 extends StatefulWidget {
  const BottomNav1({super.key});

  @override
  State<BottomNav1> createState() => _BottomNav1();
}

class _BottomNav1 extends State<BottomNav1> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    // Center(child: Text("Home")),
    State1Day12(),
    Tugas4MyWidgetDay10(),
    drawerbottom1(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Bottom Navigation")),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColors.darkGrey,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.menu_book_sharp, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          print(index);
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
