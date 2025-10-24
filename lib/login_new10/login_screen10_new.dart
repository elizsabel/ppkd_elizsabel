import 'package:flutter/material.dart';
import 'package:ppkd_elizsabel/Tugas_10/home_screen10.dart';

class LoginScreen10_1 extends StatefulWidget {
  const LoginScreen10_1({super.key});
  static const id = "/login_screen17";

  @override
  State<LoginScreen10_1> createState() => _LoginScreen10_1State();
}

class _LoginScreen10_1State extends State<LoginScreen10_1> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  bool isVisibility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 232, 239),
      appBar: AppBar(
        title: Text(
          "Form Register Class Flutter",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFB6AE9F),
      ),
      body: Stack(children: [buildLayer()]),
    );
  }
  //   login() async {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => HomeScreen()),
  //   );
  // }

  final _formKey = GlobalKey<FormState>();

  String? get customFont => null;
  SafeArea buildLayer() {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Mohon isi formulir berikut ini dengan teliti!",
                  style: TextStyle(fontSize: 16),
                ),
                height(20),
                buildTitle("Name"),
                height(10),
                buildTextField(
                  hintText: "Enter your Name",
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name cannot be empty";
                    }
                    return null;
                  },
                ),
                height(20),
                buildTitle("Email"),
                height(10),
                buildTextField(
                  hintText: "Enter your email",
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email cannot be empty";
                    } else if (!value.contains('@')) {
                      return "invalid email";
                    } else if (!RegExp(
                      r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
                    ).hasMatch(value)) {
                      return "Invalid email format";
                    }
                    return null;
                  },
                ),
                height(20),
                buildTitle("Number Phone"),
                height(10),
                buildTextField(
                  hintText: "Enter your number phone",
                  controller: phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return "telephone numbers must not contain letters";
                    }
                    return null;
                  },
                ),

                height(20),
                buildTitle("City of Domicile"),
                height(10),
                buildTextField(
                  hintText: "Enter your domicile",
                  controller: cityController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "City of Domicile cannot be empty";
                    }
                    return null;
                  },
                ),

                height(20),
                Container(
                  width: 417.21,
                  height: 48.14,
                  decoration: BoxDecoration(
                    color: Color(0xFFB6AE9F),
                    borderRadius: BorderRadius.circular(10.7),
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Confirm Registration Data"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Name : ${nameController.text}"),
                                  Text("Email : ${emailController.text}"),
                                  Text(
                                    "Phone Number : ${phoneController.text}",
                                  ),
                                  Text(
                                    "City of Domicile : ${cityController.text}",
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),

                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFB6AE9F),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen10(
                                          name: nameController.text,
                                          city: cityController.text,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text("next"),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Validation Error"),
                              content: Text("Please fill all fields"),
                              actions: [
                                TextButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 21.74,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
      obscureText: isPassword ? isVisibility : false,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isVisibility = !isVisibility;
                  });
                },
                icon: Icon(
                  isVisibility ? Icons.visibility_off : Icons.visibility,
                  // color: AppColor.gray88,
                ),
              )
            : null,
      ),
    );
  }

  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);

  Widget buildTitle(String text) {
    return Row(
      children: [
        Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        // Text(text, style: TextStyle(fontSize: 12, color: AppColor.gray88)),
      ],
    );
  }
}
