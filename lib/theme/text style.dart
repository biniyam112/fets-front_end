import 'package:flutter/material.dart';
import 'theme.dart';

ThemeData lightTheme = ThemeData(
  backgroundColor: backgroundColor,
  textTheme: const TextTheme(
    headline3: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
    headline4: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    headline5: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14,
    ),
  ).apply(
    displayColor: Colors.black,
  ),
);
