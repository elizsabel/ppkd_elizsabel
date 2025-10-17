import 'package:flutter/material.dart';

class State1Day12 extends StatefulWidget {
  const State1Day12({super.key});

  @override
  State<State1Day12> createState() => _State1Day12State();
}

class _State1Day12State extends State<State1Day12> {
  bool showText = true;
  bool showIcon = true;
  bool showText1 = true;
  int counter = 0;
  bool showBox = true;
  int counter1 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home", style: TextStyle(color: Color(0xFF896C6C))),
        backgroundColor: Color(0xFFDCD7C9),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFB6AE9F),
                    borderRadius: BorderRadius.circular(20),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(2, 2),
                        spreadRadius: 3,
                        blurRadius: 10,
                      ),
                    ],
                  ),

                  child: Column(
                    children: [
                      if (showText)
                        Text(
                          "ELIZSABEL",
                          style: TextStyle(
                            fontSize: 30,
                            color: const Color.fromARGB(255, 97, 69, 43),
                          ),
                        ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFDCD7C9),
                        ),
                        onPressed: () {
                          print("Tampilkan Teks : $showText");
                          showText = !showText;
                          setState(() {});
                        },
                        child: Text(
                          showText ? "Sembunyikan" : "Tampilkan",
                          style: TextStyle(color: Color(0xFF896C6C)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Tugas ke-2
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    print("Tampilkan Icon :$showIcon");
                    showIcon = !showIcon;
                    setState(() {});
                  },

                  icon: Icon(
                    showIcon ? Icons.favorite : Icons.favorite,
                    color: showIcon
                        ? Color.fromARGB(255, 216, 70, 70)
                        : const Color.fromARGB(255, 144, 153, 137),
                  ),
                ),
                if (showIcon)
                  Text("Disukai", style: TextStyle(color: Color(0xFF896C6C))),
              ],
            ),

            // Soal 3
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFB6AE9F),
                  borderRadius: BorderRadius.circular(10),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2, 2),
                      spreadRadius: 3,
                      blurRadius: 10,
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    if (showText1)
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      ),
                    TextButton(
                      onPressed: () {
                        print("Tampilkan text : $showText1");
                        showText1 = !showText1;
                        setState(() {});
                      },

                      child: Text(showText1 ? "kembali" : "Lihat Selengkapnya"),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Color(0xFFB6AE9F),
                borderRadius: BorderRadius.circular(10),

                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2, 2),
                    spreadRadius: 3,
                    blurRadius: 10,
                  ),
                ],
              ),

              child: Column(
                children: [
                  Text(
                    "Tampilkan Nomor",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF896C6C),
                    ),
                  ),
                  Text(counter.toString()),
                ],
              ),
            ),

            //tugas ke-5
            InkWell(
              onTap: () {
                print("Kotak di sentuh");
                setState(() {
                  showBox = !showBox;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color(0xFFB6AE9F),
                    borderRadius: BorderRadius.circular(5),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(2, 2),
                        spreadRadius: 3,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      showBox ? "  " : "Holla!",
                      style: TextStyle(color: Color(0XFF896C6C), fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),

            //tugas ke-6
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFB6AE9F),
                  borderRadius: BorderRadius.circular(5),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2, 2),
                      spreadRadius: 3,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: GestureDetector(
                  onLongPress: () {
                    print("Tekan lama : menambahkan $counter1");
                    setState(() {
                      counter1 += 3;
                    });
                  },
                  onDoubleTap: () {
                    print("Tekan dua kali : menambahkan $counter1");
                    setState(() {
                      counter1 += 2;
                    });
                  },
                  onTap: () {
                    print("Tekan sekali : menambahkan $counter1");
                    setState(() {
                      counter1++;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        "Tekan disini",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0XFF896C6C),
                        ),
                      ),
                      Text(
                        counter1.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      //tugas ke-4
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              print("Tambah $counter");
              counter += 1;
              setState(() {});
            },
            backgroundColor: Color(0xFFDCD7C9),
            child: Column(children: [Icon(Icons.add, size: 40)]),
          ),

          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              print("Kurang $counter");
              counter -= 1;
              setState(() {});
            },
            backgroundColor: Color(0xFFDCD7C9),
            child: Column(children: [Icon(Icons.minimize, size: 40)]),
          ),
        ],
      ),
    );
  }
}
