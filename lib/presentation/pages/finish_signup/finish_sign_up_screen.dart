import 'package:flutter/material.dart';
import '../../components/components.dart';
import 'components/body.dart';

class FinishSignup extends StatelessWidget {
  const FinishSignup({Key? key}) : super(key: key);

  static const route = 'signup-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        context,
        title: 'Finish Signup',
        background: Colors.white,
      ),
      body: const Body(),
    );
  }
}
