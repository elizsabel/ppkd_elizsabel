import 'package:flutter/material.dart';

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

            Padding(
              padding: const EdgeInsets.only(left: 37, right: 35),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  hintText: "Mobile number or email address",
                  hintStyle: TextStyle(fontSize: 14),
                ),
              ),
            ),

            SizedBox(height: 15),

            //BARIS 2 password
            Padding(
              padding: const EdgeInsets.only(left: 37, right: 35),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  hintText: "Password",
                  hintStyle: TextStyle(fontSize: 14),
                ),
              ),
            ),

            SizedBox(height: 15),

            Container(
              width: 322,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: BorderRadius.circular(3),
              ),
              child: TextButton(
                onPressed: () {
                  print("Log in");
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

            SizedBox(height: 15),
            Column(
              children: [
                Text(
                  "Forgotten Password?",
                  style: TextStyle(color: Colors.blue[700]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
