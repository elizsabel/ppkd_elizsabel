import 'package:flutter/material.dart';
import 'package:ppkd_elizsabel/Tugas_11/Login_screen11.dart';
import 'package:ppkd_elizsabel/Tugas_11/view/list_user.dart';
import 'package:ppkd_elizsabel/login_new10/preference_handler.dart';

class Drawer11 extends StatefulWidget {
  const Drawer11({super.key});

  @override
  State<Drawer11> createState() => _Drawer11State();
}

class _Drawer11State extends State<Drawer11> {
  int _selectedIndex = 0;
  static const List<String> _titles = ["Home"];

  static const List<Widget> _widgetOptions = [
    // Center(child: Text("Home")),
    ListUserPage(),
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
        backgroundColor: Colors.brown[200],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/poto.jpg"),
              ),
              title: Text("Elizsabel"),
              subtitle: Text("Peserta PPKD"),
            ),
            Divider(),

            ListTile(
              onTap: () {
                onTapDrawer(0);
              },
              leading: Icon(Icons.list),
              title: Text("Home"),
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
