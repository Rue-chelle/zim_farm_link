import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: const Color(0xFF4CAF50), // green for farming/eco feel
  accentColor: const Color(0xFF81C784),
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Montserrat', // or another clean font
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF4CAF50),
    elevation: 2,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: const Color(0xFF4CAF50), width: 2),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF4CAF50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ),
);
