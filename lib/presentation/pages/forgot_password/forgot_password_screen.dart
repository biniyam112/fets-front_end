import 'package:flutter/material.dart';

import '../../components/components.dart';
import 'components/body.dart';

class ForogtPassword extends StatelessWidget {
  const ForogtPassword({Key? key}) : super(key: key);

  static const route = 'forgot-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(
        context,
        title: 'Forgot password',
        background: Colors.white,
      ),
      body: const Body(),
    );
  }
}
