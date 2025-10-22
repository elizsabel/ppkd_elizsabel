import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ppkd_elizsabel/tugasflutter/appcolor.dart';

class menu_tugas7 extends StatefulWidget {
  const menu_tugas7({super.key});

  @override
  State<menu_tugas7> createState() => _menu_tugas7State();
}
//
class _menu_tugas7State extends State<menu_tugas7> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (value) {
                print(value);
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            Text("Saya menyetujui semua pernyataan yang berlaku"),
          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Color(0XFFF5BABB)),
          onPressed: isChecked ? () {} : null,
          child: Text(
            isChecked
                ? "Lanjutkan pendaftaran diperbolehkan"
                : "Anda belum bisa melanjutkan",
          ),
        ),
      ],
    );
  }
}

// switch tugas 2
class switch7 extends StatefulWidget {
  const switch7({super.key});

  @override
  State<switch7> createState() => _switch7State();
}

class _switch7State extends State<switch7> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isSwitched ? Colors.black54 : Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 300),
            Text("Aktifkan Mode Gelap", style: TextStyle(color: Colors.brown)),
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
            Text(
              isSwitched ? "Mode Gelap Aktif" : "Mode Terang Aktif",
              style: TextStyle(color: Colors.brown),
            ),
          ],
        ),
      ),
    );
  }
}

// tugas 3 pilih kategori
class dropDown7 extends StatefulWidget {
  const dropDown7({super.key});

  @override
  State<dropDown7> createState() => _dropDown7State();
}

class _dropDown7State extends State<dropDown7> {
  String? dropDownValue;
  final List<String> list = ["Elekronik", "Pakaian", "Makanan"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text("Pilih Kategori Produk"),
        DropdownButton(
          value: dropDownValue,
          items: list.map((String val) {
            return DropdownMenuItem(
              value: val,
              child: Text(val, style: TextStyle(color: Colors.black)),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              dropDownValue = value;
            });
            print(dropDownValue);
          },
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Anda memilih Kategori :"),
            Text(dropDownValue.toString()),
          ],
        ),
      ],
    );
  }
}

//date picker tanggal lahir
class DatePicker7 extends StatefulWidget {
  const DatePicker7({super.key});

  @override
  State<DatePicker7> createState() => _DatePicker7State();
}

class _DatePicker7State extends State<DatePicker7> {
  DateTime? selectedPicked = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              firstDate: DateTime(1940),
              lastDate: DateTime(2100),
            );
            if (picked != null) {
              print(picked);
              setState(() {
                selectedPicked = picked;
              });
            }
          },
          child: Text("Pilih Tanggal"),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Tanggal Lahir : "),
            Text(DateFormat('dd-MMM-yyyy').format(selectedPicked!)),
          ],
        ),
      ],
    );
  }
}

//waktu PENGINGAT
class timePicker7 extends StatefulWidget {
  const timePicker7({super.key});

  @override
  State<timePicker7> createState() => _timePicker7State();
}

class _timePicker7State extends State<timePicker7> {
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () async {
            final TimeOfDay? picked = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (picked != null) {
              print(picked);
              setState(() {
                selectedTime = picked;
              });
            }
          },
          child: Text("Pilih Waktu Pengingat"),
        ),
        SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Pengingat diatur pukul : "),
            Text(
              selectedTime != null
                  ? selectedTime!.format(context)
                  : "Belum dipilih",
            ),
          ],
        ),
      ],
    );
  }
}
