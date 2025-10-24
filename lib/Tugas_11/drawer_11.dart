import 'package:flutter/material.dart';
import 'package:ppkd_elizsabel/Tugas_11/Login_screen11.dart';
import 'package:ppkd_elizsabel/Tugas_11/view/create_customer11.dart';
import 'package:ppkd_elizsabel/login_new10/preference_handler.dart';
import 'package:ppkd_elizsabel/tugas9/listview_list.dart';
import 'package:ppkd_elizsabel/tugas9/listview_list_map.dart';
import 'package:ppkd_elizsabel/tugas9/listview_model.dart';

class Drawer11 extends StatefulWidget {
  const Drawer11({super.key});

  @override
  State<Drawer11> createState() => _Drawer11State();
}

class _Drawer11State extends State<Drawer11> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    // Center(child: Text("Home")),
    ListviewListWidget9(),
    ListviewListMap9(),
    ListviewListModel9(),
    CRWidget11(),
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
              title: Text("Elizsabel"),
              subtitle: Text("Welcome"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(0);
              },
              leading: Icon(Icons.home),
              title: Text("Input Widget"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              leading: Icon(Icons.list),
              title: Text("ListViewList Widget"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(2);
              },
              leading: Icon(Icons.list),
              title: Text("ListViewListMap Widget"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(3);
              },
              leading: Icon(Icons.list),
              title: Text("ListViewModel Widget"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(4);
              },
              leading: Icon(Icons.list),
              title: Text("CR DB Widget"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                PreferenceHandler.removeLogin();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen11()),
                  (route) => false,
                );
              },
              leading: Icon(Icons.outbond),
              title: Text("LogOut"),
            ),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
