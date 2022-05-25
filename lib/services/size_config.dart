import 'package:flutter/material.dart';

class SizeConfig {
  static double? screenHeight, screenWidth;
  static Orientation? orientation;
  MediaQueryData? mediaQuery;

  void init(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    screenHeight = mediaQuery!.size.height;
    screenWidth = mediaQuery!.size.width;
    orientation = mediaQuery!.orientation;
  }
}

Widget verticalSpacing(double spacing) {
  return SizedBox(height: spacing);
}

Widget horizontalSpacing(double spacing) {
  return SizedBox(width: spacing);
}
