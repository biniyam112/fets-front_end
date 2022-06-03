import 'package:fets_mobile/presentation/components/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  static const String route = 'account';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'Account',
      ),
      body: const Body(),
    );
  }
}
