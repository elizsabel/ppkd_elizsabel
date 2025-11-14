import 'package:flutter/material.dart';
import 'package:ppkd_elizsabel/Tugas15/views/homepage.dart';
import 'package:ppkd_elizsabel/Tugas15/views/loginpage.dart';
import 'package:ppkd_elizsabel/Tugas_11/preferences/preference_handler.dart';
import 'package:ppkd_elizsabel/tugas9/app_image.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
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
          MaterialPageRoute(builder: (context) => HomePageGlowTap()),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginCustGlow()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset(AppImage.poto)),
          Text(
            "GlowTap",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
