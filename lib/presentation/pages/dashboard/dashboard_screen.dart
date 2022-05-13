import 'package:fets_mobile/presentation/pages/search/search.dart';
import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/material.dart';


import 'components/components.dart';

class DashboardScreen extends StatefulWidget {
  static const route = "dashboard";
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        backgroundColor: backgroundColor,
        body: IndexedStack(
          index: _selectedIndex,
          children: const [DashboardBody(), SearchScreen()],
        ),
        bottomNavigationBar: BottomNavbar(
          
          currentIndex: _selectedIndex,
          onItemSelected: (int val) {
            setState(() {
              _selectedIndex = val;
            });
          },
        ));
  }
}
