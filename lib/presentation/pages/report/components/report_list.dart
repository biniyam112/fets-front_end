import 'package:fets_mobile/presentation/pages/report/report.dart';
import 'package:flutter/material.dart';

class ReportList extends StatelessWidget {
  const ReportList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Column(children: const [
        TaskReportTile(),
        TaskReportTile(),
        TaskReportTile(),
      ]),
    ));
  }
}
