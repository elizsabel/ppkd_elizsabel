import 'package:flutter/material.dart';

class tugas8_2 extends StatefulWidget {
  const tugas8_2({super.key});

  @override
  State<tugas8_2> createState() => _tugas8_2State();
}

class _tugas8_2State extends State<tugas8_2> {
  @override
  //tentang aplikasi
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tentang Aplikasi"),
        backgroundColor: Color(0XFFF5D2D2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(
              "GlowTap",
              style: TextStyle(color: Color(0XFFD6A99D), fontSize: 40),
            ),
            SizedBox(height: 30),
            Text(
              "GlowTap adalah aplikasi senter minimalis untuk perangkat Android yang dirancang untuk memberikan pencahayaan instan dengan hanya satu ketukan. Aplikasi ini mengubah lampu kilat (flash) perangkat Anda menjadi sumber cahaya yang dapat diandalkan dalam situasi gelap, darurat, atau penggunaan sehari-hari. Dengan antarmuka yang sederhana dan tanpa fitur tambahan yang rumit, GlowTap fokus pada pengalaman pengguna yang cepat dan efisien.",
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
