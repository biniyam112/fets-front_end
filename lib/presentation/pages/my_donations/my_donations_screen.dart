import 'package:flutter/material.dart';

import '../../components/components.dart';
import 'components/body.dart';

class MyDonationsScreen extends StatelessWidget {
  const MyDonationsScreen({Key? key}) : super(key: key);

  static const route = 'my-donations';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'My donations',
      ),
      body: const Body(),
    );
  }
}
