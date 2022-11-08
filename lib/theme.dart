import 'package:flutter/material.dart';

class ThemeHelper {
  // return DarkMode
  static ThemeData get darkMode => ThemeData(
      primaryColor: Colors.black,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
      scaffoldBackgroundColor: Colors.grey);
}
