import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData themeData = ThemeData(
    primaryColor: Colors.blue[300],
    hintColor: Colors.pinkAccent[100],
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
    
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    colorScheme:const  ColorScheme.light(surface: Colors.white,
   background: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      onBackground: Colors.black,
    ).copyWith(background: Colors.white),
  );
}