import 'package:flutter/material.dart';
import 'package:ppkd_elizsabel/tugas9/app_image.dart';
import 'package:ppkd_elizsabel/tugas9/pakaian_model.dart';
import 'package:ppkd_elizsabel/tugas9/rupiah.dart';

class ListviewListModel9 extends StatefulWidget {
  const ListviewListModel9({super.key});

  @override
  State<ListviewListModel9> createState() => _ListviewListModel9();
}

class _ListviewListModel9 extends State<ListviewListModel9> {
  final List<PakaianModel> namaPakaian = [
    PakaianModel(
      name: "T-shirt",
      price: 50000,
      condition: "New",
      backgroundColor: Color(0xFF9F8383),
      image: AppImage.tshirt,
    ),
    PakaianModel(
      name: "Blouse",
      price: 250000,
      condition: "New",
      backgroundColor: Color(0xFFFFF2EB),
      image: AppImage.blouse,
    ),
    PakaianModel(
      name: "Kemeja",
      price: 100000,
      condition: "New",
      backgroundColor: Color(0xFF9F8383),
      image: AppImage.kemeja,
    ),
    PakaianModel(
      name: "Hoodie",
      price: 125000,
      condition: "New",
      backgroundColor: Color(0xFFFFF2EB),
      image: AppImage.hoodie,
    ),
    PakaianModel(
      name: "Jacket",
      price: 300000,
      condition: "New",
      backgroundColor: Color(0xFF9F8383),
      image: AppImage.jaket,
    ),
    PakaianModel(
      name: "Dress",
      price: 350000,
      condition: "New",
      backgroundColor: Color(0xFFFFF2EB),
      image: AppImage.dress,
    ),
    PakaianModel(
      name: "Sweater",
      price: 180000,
      condition: "New",
      backgroundColor: Color(0xFF9F8383),
      image: AppImage.sweater,
    ),
    PakaianModel(
      name: "Rok",
      price: 150000,
      condition: "New",
      backgroundColor: Color(0xFFFFF2EB),
      image: AppImage.rok,
    ),
    PakaianModel(
      name: "Cargo",
      price: 180000,
      condition: "New",
      backgroundColor: Color(0xFF9F8383),
      image: AppImage.cargo,
    ),
    PakaianModel(
      name: "Kulot",
      price: 150000,
      condition: "New",
      backgroundColor: Color(0xFFFFF2EB),
      image: AppImage.kulot,
    ),
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
            //   DelightToastBar(
            //     autoDismiss: true,
            //     snackbarDuration: Duration(milliseconds: 2000),
            //     builder: (context) => ToastCard(
            //       leading: Icon(Icons.flutter_dash, size: 28),
            //       title: Text(
            //         "${item["name"]} ${item["price"].toString().toRPCurrency()} aja",
            //         style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
            //       ),
            //     ),
            //   ).show(context);
          },
          tileColor: item.backgroundColor,
          leading: Image.asset(item.image, width: 60),
          title: Text(item.name),
          subtitle: Text(item.price.toString().toRPCurrency()),
        );
      },
    );
  }
}
