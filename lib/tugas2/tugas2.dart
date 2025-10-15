import 'package:flutter/material.dart';

class Tugas2WidgetDay9 extends StatelessWidget {
  const Tugas2WidgetDay9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil Lengkap",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 176, 177, 105),
      ),
      
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/poto.jpg"),
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ELIZSABEL",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: const Color.fromARGB(255, 151, 131, 89),
                ),
              ),
            ],
          ),

          // baris 2 buatlah email dan nomor
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            child: Container(
              color: const Color.fromARGB(225, 211, 195, 105),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email),
                  SizedBox(width: 15),
                  Text("elizsabel88@gmail.com"),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone_android),
                Text("0896-0409-1424"),
                SizedBox(width: 18),
              ],
            ),
          ),

          //baris 3 menampilkan postingan dan followers
          Row(
            spacing: 10,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 221, 205, 152),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Column(children: [Text("50"), Text("Postingan")]),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 202, 177, 131),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                  child: Column(children: [Text("100k"), Text("Followers")]),
                ),
              ),
            ],
          ),

          //Baris 5 buatlah profil diri
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text("Deskripsi Profil : "),
                Text(
                  "Saat ini saya sedang mengikuti pelatihan mobile programming di PPKD Jakarta Pusat, dan memiliki ketertarikan besar pada dunia teknologi, khususnya dalam pengembangan aplikasi mobile yang bermanfaat dan memiliki desain menarik.",
                ),
                //SizedBox(width: 15),
                SizedBox(height: 20),
              ],
            ),
          ),

          // baris 6 hiasan visual menggunakan container
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 221, 201, 142),
                    gradient: LinearGradient(
                      colors: [
                        Colors.amber,
                        const Color.fromARGB(255, 240, 241, 142),
                        const Color.fromARGB(255, 168, 160, 82),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
