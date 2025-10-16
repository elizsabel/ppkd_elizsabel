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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),

      body: Column(
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
                          fontSize: 40,
                          color: const Color(0XFF957C62),
                        ),
                      ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB7B89F),
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

          // Soal 2 tampilkan Icon
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
                Text("Disukai", style: TextStyle(color: Color(0xFFB77466))),
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
                height: 100,
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
                    style: TextStyle(color: Color(0xFF896C6C), fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      //tugas ke-4
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("kurang $counter");
          counter--;
          setState(() {});
        },
        backgroundColor: Color(0xFFB7B597),
        child: Icon(Icons.add),
      ),
    );
  }
}
