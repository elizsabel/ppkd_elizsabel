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
              "GlowTap adalah aplikasi mobile layanan home service perawatan kecantikan profesional yang menghadirkan pengalaman perawatan ekslusif langsung ke rumah anda. dengan menghubungkan pengguna dan dokter kecantikan bersertifikat, GlowTap menawarkan cara baru untuk merawat kulit secara aman, nyaman, dan personal - hanya dengan satu sentuhan.",
              textAlign: TextAlign.justify,
            ),
            // Text(
            //   "GlowTap hadir dari kebutuhan masyarakat modern yang menginginkan perawatan wajah seperti skinbooster, DNA Salmon, dan Botox tanpa harus datang ke klinik. melalui teknologi, GlowTap memberikan solusi inovatif yang menghubungkan kemudahan pemesanan online, layanan medis terpecaya, dan pengalaman premium seperti klinik mewah, namun fleksibel dan terjangkau",
            // ),
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
