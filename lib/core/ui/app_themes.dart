import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: Colors.blue,
      backgroundColor: Colors.grey,
      textTheme: const TextTheme(
        bodySmall: TextStyle(
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          color: Colors.black,
        ),
        bodyLarge: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      primarySwatch: Colors.teal,
      backgroundColor: Colors.black,
      textTheme: const TextTheme(
        bodySmall: TextStyle(
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
