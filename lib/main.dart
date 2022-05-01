import 'package:fets_mobile/presentation/pages/signup/signup.dart';
import 'package:fets_mobile/services/services.dart';
import 'package:fets_mobile/theme/text%20style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FETS',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      routes: route,
      initialRoute: SignUpScreen.route,
    );
  }
}
