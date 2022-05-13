import 'package:fets_mobile/presentation/pages/components/components.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class ForogtPassword extends StatelessWidget {
  const ForogtPassword({Key? key}) : super(key: key);

  static const route = 'forgot-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(
          onPress: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Body(),
    );
  }
}
