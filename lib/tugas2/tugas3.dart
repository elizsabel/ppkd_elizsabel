import 'package:flutter/material.dart';

class Tugas3MyWidgetDay10 extends StatelessWidget {
  const Tugas3MyWidgetDay10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: const Color(0xFF777C6D),
      ),
      backgroundColor: const Color(0xFFCBCBCB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Formulir Pendaftaran",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                height: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFB7B89F),
                  //borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //BARIS 1 NAMA
                    Text("Nama"),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        border: OutlineInputBorder(
                          //borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Masukan Nama Anda",
                      ),
                    ),

                    SizedBox(height: 15),

                    //BARIS 2 EMAIL
                    Text("Email"),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        border: OutlineInputBorder(
                          //borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Masukkan Email Anda",
                      ),
                    ),

                    SizedBox(height: 15),

                    //BARIS 3 NOMOR
                    Text("Nomor"),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        border: OutlineInputBorder(
                          //borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Masukan Nomor Anda",
                      ),
                    ),

                    SizedBox(height: 15),

                    //BARIS 4 BUAT DESKRIPSI
                    Text("Deskripsi"),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(60.0),
                        border: OutlineInputBorder(
                          //borderRadius: BorderRadius.circular(),
                        ),
                        hintText: "Masukan Deskripsi Anda",
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //TUGAS 2
            Text(
              "Galeri Grid",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            GridView.count(
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 3,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 20, right: 30, bottom: 20),
              children: List.generate(6, (index) {
                return Container(
                  alignment: Alignment.center,
                  color: Color(0xFFB7B89F),

                  //Memberi text pada Box
                  child: Stack(
                    children: [
                      Text("box ${index + 1}", style: TextStyle(fontSize: 15)),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
