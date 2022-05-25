import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabItems extends StatelessWidget {
  const TabItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      automaticIndicatorColorAdjustment: false,
      indicatorColor: backgroundColor,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey.shade500,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      tabs: const [
        Tab(
          text: "Popular",
        ),
        Tab(
          text: "Education",
        ),
        Tab(
          text: "Food",
        ),
      ],
    );
  }
}
