import 'package:flutter/material.dart';

class AppTheme {
  static final darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFF212121),
      accentColor: Colors.white,
      accentIconTheme: IconThemeData(color: Colors.black),
      scaffoldBackgroundColor: Colors.white,
      dividerColor: Colors.black12,
      textTheme: textTheme);

  static final lightTheme = ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: const Color(0xFFE5E5E5),
      accentColor: Colors.black,
      accentIconTheme: IconThemeData(color: Colors.white),
      scaffoldBackgroundColor: Colors.white,
      dividerColor: Colors.white54,
      textTheme: textTheme);

  static final textTheme = const TextTheme(
    headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w400),
    bodyText1: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400),
    button: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w900),
  );
}
