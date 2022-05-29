import 'package:fets_mobile/theme/colors.dart';
import 'package:flutter/material.dart';

import '../../components/components.dart';
import 'components/body.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  static const route = "report";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: CustomBackButton(
          onPress: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          'Report',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: const Body(),
    );
  }
}
