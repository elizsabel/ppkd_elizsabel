import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ppkd_elizsabel/tugas9/rupiah.dart';

class ListviewListMap9 extends StatefulWidget {
  const ListviewListMap9({super.key});

  @override
  State<ListviewListMap9> createState() => _ListviewListMap9();
}

class _ListviewListMap9 extends State<ListviewListMap9> {
  final List<Map<String, dynamic>> namaPakaian = [
    {"name": "T-shirt", "price": 50000, "icon": Icons.shopping_bag},
    {
      "name": "Blouse",
      "price": 250000,
      "condition": "New",
      "icon": Icons.shopping_bag,
    },
    {
      "name": "Kemeja",
      "price": 100000,
      "condition": "New",
      "icon": Icons.shopping_bag,
    },
    {
      "name": "Hoodie",
      "price": 125000,
      "condition": "New",
      "icon": Icons.shopping_bag,
    },
    {
      "name": "Jacket",
      "price": 300000,
      "condition": "New",
      "icon": Icons.shopping_bag,
    },
    {
      "name": "Dress",
      "price": 350000,
      "condition": "New",
      "icon": Icons.shopping_bag,
    },
    {
      "name": "Sweater",
      "price": 180000,
      "condition": "New",
      "icon": Icons.shopping_bag,
    },
    {
      "name": "Rok",
      "price": 150000,
      "condition": "New",
      "icon": Icons.shopping_bag,
    },
    {
      "name": "Cargo",
      "price": 180000,
      "condition": "New",
      "icon": Icons.shopping_bag,
    },
    {
      "name": "Kulot",
      "price": 150000,
      "condition": "New",
      "icon": Icons.shopping_bag,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: namaPakaian.length,
      itemBuilder: (BuildContext context, int index) {
        final item = namaPakaian[index];
        return ListTile(
          onTap: () {
            //Versi 1
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     backgroundColor: AppColor.army1,
            //     content: Text(
            //       "${item["name"]} ${item["price"].toString().toRPCurrency()} aja",
            //     ),
            //   ),
            // );

            //Versi 2
            // Fluttertoast.showToast(
            //   backgroundColor: Colors.blue,
            //   msg:
            //       "${item["name"]} ${item["price"].toString().toRPCurrency()} aja",
            // );

            //Versi 3
            DelightToastBar(
              autoDismiss: true,
              snackbarDuration: Duration(milliseconds: 2000),
              builder: (context) => ToastCard(
                leading: Icon(Icons.flutter_dash, size: 28),
                title: Text(
                  "${item["name"]} ${item["price"].toString().toRPCurrency()} aja",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                ),
              ),
            ).show(context);
          },
          leading: Icon(item["icon"]),
          title: Text(item["name"]),
          subtitle: Text(item["price"].toString().toRPCurrency()),
        );
      },
    );
  }
}
