import 'package:fets_mobile/presentation/pages/components/custom_back_button.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

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
