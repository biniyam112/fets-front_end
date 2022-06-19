import 'package:fets_mobile/features/models/project.dart';
import 'package:flutter/material.dart';

import '../../components/components.dart';
import 'components/body.dart';

class MyDonationsScreen extends StatelessWidget {
  const MyDonationsScreen({Key? key}) : super(key: key);

  static const route = 'my-donations';

  @override
  Widget build(BuildContext context) {
    var projects = ModalRoute.of(context)!.settings.arguments as List<Project>;
    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'My donations',
      ),
      body: Body(projects: projects),
    );
  }
}
