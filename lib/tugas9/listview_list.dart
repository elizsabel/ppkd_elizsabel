import 'package:flutter/material.dart';

class ListviewListWidget9 extends StatefulWidget {
  const ListviewListWidget9({super.key});

  @override
  State<ListviewListWidget9> createState() =>
      _ListviewListWidget9();
}

class _ListviewListWidget9 extends State<ListviewListWidget9> {
  final List<String> namaPakaian = ["T-shirt", "Blouse", "Kemeja", "Hoodie", "Jacket","Dress","Sweater","Rok","Cargo", "kulot"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: namaPakaian.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text(namaPakaian[index]));
      },
    );
  }
}