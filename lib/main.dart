import 'package:fets_mobile/presentation/pages/my_donations/my_donations_screen.dart';
import 'package:fets_mobile/services/services.dart';
import 'package:fets_mobile/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (_) => MaterialApp(
        title: 'FETS',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        routes: route,
        initialRoute: MyDonationsScreen.route,
      ),
    );
  }
}
