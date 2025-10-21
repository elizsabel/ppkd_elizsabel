import 'package:flutter/material.dart';

class tugas8_2 extends StatefulWidget {
  const tugas8_2({super.key});

  @override
  State<tugas8_2> createState() => _tugas8_2State();
}

class _tugas8_2State extends State<tugas8_2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tentang Aplikasi"),
        backgroundColor: Color(0xFFB6AE9F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(
              "GlowTap",
              style: TextStyle(color: Colors.brown, fontSize: 40),
            ),
            SizedBox(height: 10),
            Text(
              "Plaform ini bernama GlowTap, dalam 1 kali tap langsung glowing. One Tap, One App, GlowTap",
            ),
            Spacer(),
            SizedBox(height: 80),
            Text("Elizsabel"),
            SizedBox(height: 10),
            Text("Ver 1.0"),
          ],
        ),
      ),
    );
  }
}
