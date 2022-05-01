import 'package:fets_mobile/presentation/pages/signup/signup.dart';
import 'package:fets_mobile/services/services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: route,
      initialRoute: SignUpScreen.route,
    );
  }
}
