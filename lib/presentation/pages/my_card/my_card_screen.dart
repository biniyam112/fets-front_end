import 'package:fets_mobile/presentation/components/components.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class MyCardScreen extends StatelessWidget {
  const MyCardScreen({Key? key}) : super(key: key);

  static const String route = 'my-card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Card'),
      body: const Body(),
    );
  }
}
