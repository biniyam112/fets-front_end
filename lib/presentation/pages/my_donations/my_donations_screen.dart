import 'package:fets_mobile/presentation/pages/pages.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class MyDonationsScreen extends StatelessWidget {
  const MyDonationsScreen({Key? key}) : super(key: key);

  static const route = 'my-donations';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(
          onPress: () {},
        ),
        title: Text(
          'My donations',
          style: Theme.of(context).textTheme.headline5,
        ),
        centerTitle: true,
        actions: [],
      ),
      body: const Body(),
    );
  }
}
