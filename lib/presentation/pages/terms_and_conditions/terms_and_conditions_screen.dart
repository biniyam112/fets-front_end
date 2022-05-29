import 'package:flutter/material.dart';

import '../../components/components.dart';
import 'components/body.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  static const route = 'terms-and-conditions';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'Terms and conditions',
        background: Colors.white,
      ),
      body: const Body(),
    );
  }
}
