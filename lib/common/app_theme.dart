import 'package:flutter/material.dart';

class AppTheme {
  static final darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.grey,
      brightness: Brightness.dark,
      backgroundColor: Colors.grey,
      buttonColor: Colors.grey,
      scaffoldBackgroundColor: Colors.grey,
      textTheme: textTheme);

  static final lightTheme = ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      buttonColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      textTheme: textTheme);

  static final textTheme = const TextTheme(
    headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w400),
    bodyText1: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400),
    button: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w900),
  );
}
