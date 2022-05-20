import 'package:flutter/material.dart';

import 'components.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [ReportList(), OverallReportTile()],
    );
  }
}
