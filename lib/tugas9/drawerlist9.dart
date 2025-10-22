import 'package:flutter/material.dart';
import 'package:ppkd_elizsabel/tugas9/listview_list.dart';
import 'package:ppkd_elizsabel/tugas9/listview_list_map.dart';
import 'package:ppkd_elizsabel/tugas9/listview_model.dart';

class Drawerlist9 extends StatefulWidget {
  const Drawerlist9({super.key});

  @override
  State<Drawerlist9> createState() => _DrawerList9();
}

class _DrawerList9 extends State<Drawerlist9> {
  int _selectedIndex = 0;
  //judul appbar
  static const List<String> _titles = [
    "List view",
    "List View Map",
    "List view Model",
  ];
  static const List<Widget> _widgetOptions = [
    // Center(child: Text("Home")),
    ListviewListWidget9(),
    ListviewListMap9(),
    ListviewListModel9(),
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
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Color(0XFFF5D2D2),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/poto.jpg"),
              ),
              title: Text("Hai Elizsabel"),
              subtitle: Text("selamat datang"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(0);
              },
              leading: Icon(Icons.list),
              title: Text("List View"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              leading: Icon(Icons.list_alt),
              title: Text("List View Map"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(2);
              },
              leading: Icon(Icons.list_sharp),        
              title: Text("List View Model"),
            ),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
