import 'package:fets_mobile/presentation/pages/signup/signup.dart';
import 'package:fets_mobile/services/services.dart';
import 'package:fets_mobile/theme/text%20style.dart';
import 'package:flutter/material.dart';

import 'presentation/pages/dashboard/dashboard.dart';
import 'theme/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (child) {
          return MaterialApp(
            title: 'FETS',
            showSemanticsDebugger: false,
            debugShowCheckedModeBanner:false,
            theme: lightTheme,
            
            routes: route,
            initialRoute: DashboardScreen.route,
          );
        });
  }
}
