import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar(
      {Key? key, required this.onItemSelected, required this.currentIndex})
      : super(key: key);

  final Function(int) onItemSelected;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: currentIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: onItemSelected,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey.shade500,
      backgroundColor: Colors.white,
      iconSize: 21.h,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.rss_feed),
          label: "Feeds",
        ),
      ],
    );
  }
}
