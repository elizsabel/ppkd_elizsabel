import 'package:flutter/material.dart';

class Tugas3MyWidgetDay10 extends StatelessWidget {
  const Tugas3MyWidgetDay10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: const Color.fromARGB(248, 198, 166, 240),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                  color: const Color.fromARGB(255, 170, 130, 235),
                  borderRadius: BorderRadius.circular(20),
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
                          borderRadius: BorderRadius.circular(10),
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
                          borderRadius: BorderRadius.circular(10),
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
                          borderRadius: BorderRadius.circular(10),
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
                          borderRadius: BorderRadius.circular(10),
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
            GridView.builder(
              padding: EdgeInsets.all(10),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 179, 125, 223),
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
