import 'package:flutter/material.dart';
import 'package:ppkd_elizsabel/tugasflutter/home_screen6.dart';
import 'package:ppkd_elizsabel/tugasflutter/tugas5.dart';
import 'package:ppkd_elizsabel/tugasflutter/tugas6.dart';

class drawerbottom1 extends StatefulWidget {
  const drawerbottom1({super.key});

  @override
  State<drawerbottom1> createState() => _drawerbottom1State();
}

class _drawerbottom1State extends State<drawerbottom1> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    // Center(child: Text("Home")),
    HomeScreen(),
    State1Day12(),
    Day13Figma(),
  ];
  void onTapDrawer(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drawer")),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/poto.jpg"),
              ),
              title: Text("Hallo"),
              subtitle: Text("selamat datang"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(0);
              },
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              leading: Icon(Icons.payment),
              title: Text("Payment"),
            ),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
