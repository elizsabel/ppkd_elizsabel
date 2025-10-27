import 'package:flutter/material.dart';
import 'package:ppkd_elizsabel/Tugas_11/database11.dart/db_helper.dart';
import 'package:ppkd_elizsabel/Tugas_11/model/customer_model.dart';

class ListUserPage extends StatefulWidget {
  const ListUserPage({super.key});

  @override
  State<ListUserPage> createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  getData() {
    DbHelper.getAllCustomer();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("List User")),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("List data user:"),
          ),
          Expanded(
            child: FutureBuilder(
              future: DbHelper.getAllCustomer(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  final data = snapshot.data as List<CustomerModel>;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final items = data[index];
                        return Column(
                          children: [
                            ListTile(
                              title: Text(items.name),
                              subtitle: Text(items.email),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}