import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme.dart';

ThemeData lightTheme = ThemeData(
  backgroundColor: backgroundColor,
  fontFamily: GoogleFonts.montserrat().fontFamily,
  textTheme: const TextTheme(
    headline3: TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 32,
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
