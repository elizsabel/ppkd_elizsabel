import 'package:flutter/material.dart';
import 'package:ppkd_elizsabel/Tugas7/menu_tugas7.dart';

class tugas7DateTime extends StatefulWidget {
  const tugas7DateTime({super.key});

  @override
  State<tugas7DateTime> createState() => _tugas7DateTime();
}

class _tugas7DateTime extends State<tugas7DateTime> {
  int _selectedIndex = 0;
  static const List<String> _titles = [
    "Syarat dan Ketentuan",
    "Mode Gelap",
    "Pilih Kategori Produk",
    "Pilih Tanggal Lahir",
    "Atur Pengingat",
  ];
  static const List<Widget> _widgetOptions = [
    // Center(child: Text("Home")),
    menu_tugas7(),
    switch7(),
    dropDown7(),
    DatePicker7(),
    timePicker7(),
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
              leading: Icon(Icons.check_box),
              title: Text("Syarat dan Ketentuan"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(1);
              },
              leading: Icon(Icons.switch_account),
              title: Text("Mode Gelap"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(2);
              },
              leading: Icon(Icons.category),
              title: Text("Pilih Kategori Produk"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(3);
              },
              leading: Icon(Icons.calendar_month),
              title: Text("Pilih Tanggal Lahir"),
            ),
            Divider(),
            ListTile(
              onTap: () {
                onTapDrawer(4);
              },
              leading: Icon(Icons.timelapse),
              title: Text("Atur pengingat"),
            ),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
