import 'package:flutter/material.dart';

class TextFieldwidget extends StatelessWidget {
  const TextFieldwidget({super.key, this.hintText});
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 322,
      height: 45,
      decoration: BoxDecoration(color: Color(0xFFF5F5F5)),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(13.0),
            //border: OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
