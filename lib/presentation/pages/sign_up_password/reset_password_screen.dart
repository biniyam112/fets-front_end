import 'package:fets_mobile/presentation/pages/pages.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  static const route = 'reset-password';

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
