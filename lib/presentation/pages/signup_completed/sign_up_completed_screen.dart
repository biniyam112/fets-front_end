import 'package:flutter/material.dart';

import 'components/body.dart';

class SignUpCompleted extends StatelessWidget {
  const SignUpCompleted({Key? key}) : super(key: key);

  static const route = 'signup-completed';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Body(),
    );
  }
}
