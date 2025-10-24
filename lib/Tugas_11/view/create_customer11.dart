import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ppkd_elizsabel/Tugas_11/database11.dart/db_helper.dart';
import 'package:ppkd_elizsabel/Tugas_11/model/customer_model.dart';

class CRWidget11 extends StatefulWidget {
  const CRWidget11({super.key});

  @override
  State<CRWidget11> createState() => _CRWidgetD11State();
}

class _CRWidgetD11State extends State<CRWidget11> {
  final nameC = TextEditingController();
  final passwordC = TextEditingController();
  final emailC = TextEditingController();
  final phoneC = TextEditingController();
  final cityC = TextEditingController();
  getData() {
    DbHelper.getAllCustomer();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 12,
          children: [
            Text("Pendaftaran Customer", style: TextStyle(fontSize: 24)),
            buildTextField(hintText: "Name", controller: nameC),
            buildTextField(hintText: "Password", controller: passwordC),
            buildTextField(hintText: "Phone", controller: phoneC),
            buildTextField(hintText: "Email", controller: emailC),
            buildTextField(hintText: "City", controller: cityC),
            LoginButton(
              text: "Add",
              onPressed: () {
                if (nameC.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Nama belum diisi");
                } else if (emailC.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Email belum diisi");
                } else if (phoneC.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Phone belum diisi");
                } else if (passwordC.text.isEmpty) {
                  Fluttertoast.showToast(msg: "Password belum diisi");
                } else if (cityC.text.isEmpty) {
                  Fluttertoast.showToast(msg: "City belum diisi");
                } else {
                  final CustomerModel dataCustomer = CustomerModel(
                    name: nameC.text,
                    email: emailC.text,
                    phone: int.parse(phoneC.text),
                    password: int.parse(passwordC.text),
                    city: cityC.text,
                  );
                  DbHelper.createCustomer(dataCustomer).then((value) {
                    emailC.clear();
                    passwordC.clear();
                    phoneC.clear();
                    nameC.clear();
                    cityC.clear();
                    getData();
                    Fluttertoast.showToast(msg: "Data berhasil ditambahkan");
                  });
                }
              },
            ),
            SizedBox(height: 30),
            FutureBuilder(
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
          ],
        ),
      ),
    );
  }

  TextFormField buildTextField({
    String? hintText,
    bool isPassword = false,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, this.onPressed, required this.text});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Text(
          text,
          // "Login",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
