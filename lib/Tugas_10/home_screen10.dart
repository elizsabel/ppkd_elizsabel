import 'package:flutter/material.dart';
import 'package:ppkd_elizsabel/Tugas_10/login_screen10.dart';

class HomeScreen10 extends StatefulWidget {
  const HomeScreen10({super.key, required this.name, required this.city});
  final String name;
  final String city;

  @override
  State<HomeScreen10> createState() => _HomeScreen10State();
}

class _HomeScreen10State extends State<HomeScreen10> {
  static const List<Widget> _widgetOptions = [LoginScreen10()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 800),
          Text(
            "Thank you, ",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            widget.name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(" from ", style: TextStyle(fontSize: 16)),
          Text(
            widget.city,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(" have register.", style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
