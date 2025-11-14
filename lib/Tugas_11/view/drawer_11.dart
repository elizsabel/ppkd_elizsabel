import 'package:flutter/material.dart';
import 'package:ppkd_elizsabel/Tugas15/preferences/preference_handler.dart';
import 'package:ppkd_elizsabel/Tugas15/views/loginpage.dart';

class DrawerGlowTap extends StatefulWidget {
  const DrawerGlowTap({super.key});

  @override
  State<DrawerGlowTap> createState() => _DrawerGlowTapState();
}

class _DrawerGlowTapState extends State<DrawerGlowTap> {
  int _selectedIndex = 0;

  static const List<String> _titles = [
    "Home",
    "Profil",
  ];

  static const List<Widget> _screens = [
    Center(child: Text("Home GlowTap")),  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: Colors.pink[200],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile.png"),
              ),
              accountName: Text("GlowTap User"),
              accountEmail: Text("Customer GlowTap"),
              decoration: BoxDecoration(color: Colors.pinkAccent),
            ),

            // HOME
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                setState(() => _selectedIndex = 0);
                Navigator.pop(context);
              },
            ),

            // PROFILE
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profil Saya"),
              onTap: () {
                setState(() => _selectedIndex = 1);
                Navigator.pop(context);
              },
            ),

            const Divider(),

            // LOGOUT (API)
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Log Out", style: TextStyle(color: Colors.red)),
              onTap: () async {
                await PreferenceHandler.removeLogin(); // HAPUS TOKEN API

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginCustGlow(),
                  ),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),

      body: _screens[_selectedIndex],
    );
  }
}
