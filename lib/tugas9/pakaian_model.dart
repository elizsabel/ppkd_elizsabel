
import 'package:flutter/material.dart';

class PakaianModel {
  final String name;
  final int price;
  final String condition;
  final String image;
  final Color? backgroundColor;
  PakaianModel({
    required this.name,
    required this.price,
    required this.condition,
    required this.image,
    this.backgroundColor,
  });
}