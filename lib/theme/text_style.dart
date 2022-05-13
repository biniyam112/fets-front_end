import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme.dart';

ThemeData lightTheme = ThemeData(
  backgroundColor: backgroundColor,
  fontFamily: GoogleFonts.montserrat().fontFamily,
  textTheme: TextTheme(
    headline3: const TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 32,
    ),
    headline4: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    headline5: TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 16,
    ),
    headline6: TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: 14,
    ),
  ).apply(
    displayColor: Colors.black,
  ),
);