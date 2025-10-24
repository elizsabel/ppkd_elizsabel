import 'package:flutter/material.dart';
import 'package:ppkd_elizsabel/NavButton/drawer.dart';
import 'package:ppkd_elizsabel/Tugas_11/Login_screen11.dart';
import 'package:ppkd_elizsabel/Tugas_11/drawer_11.dart';
import 'package:ppkd_elizsabel/login_new10/drawer_10.dart';
import 'package:ppkd_elizsabel/login_new10/login_screen10_new.dart';
import 'package:ppkd_elizsabel/login_new10/preference_handler.dart';
import 'package:ppkd_elizsabel/tugas9/app_image.dart';
import 'package:ppkd_elizsabel/tugas_10/login_screen10.dart';

class SplashScreen10 extends StatefulWidget {
  const SplashScreen10({super.key});

  @override
  State<SplashScreen10> createState() => _SplashScreen10State();
}

class _SplashScreen10State extends State<SplashScreen10> {
  @override
  void initState() {
    super.initState();
    isLoginFunction();
  }

  isLoginFunction() async {
    Future.delayed(Duration(seconds: 3)).then((value) async {
      var isLogin = await PreferenceHandler.getLogin();
      print(isLogin);
      if (isLogin != null && isLogin == true) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Drawer11()),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen11()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/images/poto.jpg")),
          Text(
            "Waiting...",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
