import 'package:fets_mobile/presentation/pages/signup/signup.dart';
import 'package:fets_mobile/services/services.dart';
import 'package:fets_mobile/theme/text%20style.dart';
import 'package:flutter/material.dart';

import 'theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FETS',
      showSemanticsDebugger: false,
      theme: lightTheme,
      routes: route,
      initialRoute: SignUpScreen.route,
    );
  }
}
