import 'package:flutter/material.dart';

class AppTextStyle {
  static const questionTextStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);
  static final titleTextStyle = questionTextStyle.copyWith(fontSize: 18);
  static final contentTextStyle = questionTextStyle.copyWith(
      fontWeight: FontWeight.w400, color: Colors.grey, fontSize: 18);
  static const buttonTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
