import 'package:flutter/material.dart';
import 'package:ppkd_elizsabel/tugasflutter/appcolor.dart';
import 'package:ppkd_elizsabel/tugasflutter/home_screen6.dart';
import 'package:ppkd_elizsabel/tugasflutter/textfield.dart';

class Day13Figma extends StatefulWidget {
  const Day13Figma({super.key});

  @override
  State<Day13Figma> createState() => _Day13FigmaState();
}

class _Day13FigmaState extends State<Day13Figma> {
  @override
  Widget build(BuildContext context) {
    const String customFont = "Inter";
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 119.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/facebook.png"),
                ),
              ),
            ),

            // Mobile number or email
            TextFieldwidget(hintText: "Mobile number or email address"),

            SizedBox(height: 15),

            //  password
            TextFieldwidget(hintText: "Password"),

            SizedBox(height: 15),

            //log in
            Container(
              width: 322,
              height: 45,
              decoration: BoxDecoration(
                color: AppColors.darkBlue,
                borderRadius: BorderRadius.circular(3),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text(
                  "Log in",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: customFont,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            //Forgotten Password
            InkWell(
              child: TextButton(
                onPressed: () {
                  print("Menekan Forgotten Password");
                },
                child: Column(
                  children: [
                    Text(
                      "Forgotten Password?",
                      style: TextStyle(color: AppColors.darkBlue),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 0.0),

            // Buat garis
            Container(
              width: 322,
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Container(height: 1, color: AppColors.grey1)),
                  SizedBox(width: 10),
                  Text(
                    "or",
                    style: TextStyle(fontSize: 12, color: AppColors.grey1),
                  ),
                  SizedBox(width: 10),
                  Expanded(child: Container(height: 1, color: AppColors.grey1)),
                ],
              ),
            ),

            SizedBox(height: 10),

            // buat create new account
            Container(
              width: 254,
              height: 38,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3.0),
                border: Border.all(color: AppColors.grey1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(0.0),

                child: TextButton(
                  onPressed: () {
                    print("Create new account");
                  },
                  child: Text(
                    "Create new account",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: customFont,
                      fontSize: 16,
                      color: AppColors.black1,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 100),

            //teks english UK
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        "English (UK)",
                        style: TextStyle(color: AppColors.grey2, fontSize: 13),
                      ),
                      Text(
                        " اردو",
                        style: TextStyle(color: AppColors.grey2, fontSize: 13),
                      ),
                      Text(
                        " বাংলা ",
                        style: TextStyle(color: AppColors.grey2, fontSize: 13),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 60),

                Container(
                  child: Column(
                    children: [
                      Text(
                        "English (UK)",
                        style: TextStyle(color: AppColors.grey2, fontSize: 13),
                      ),
                      Text(
                        " اردو",
                        style: TextStyle(color: AppColors.grey2, fontSize: 13),
                      ),
                      Text(
                        " বাংলা ",
                        style: TextStyle(color: AppColors.grey2, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            //Text Meta
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Meta © 2023",
                  style: TextStyle(color: AppColors.grey2, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
