import 'package:fets_mobile/features/models/models.dart';
import 'package:flutter/material.dart';

import 'components.dart';

class ReportList extends StatelessWidget {
  const ReportList({Key? key, required this.subProjectList}) : super(key: key);
  final List<SubprojectData> subProjectList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
      child: Column(children: [
        ...List.generate(
          subProjectList.length,
          ((index) {
            SubprojectData subprojectData = subProjectList[index];
            return TaskReportTile(
              subprojectData: subprojectData,
            );
          }),
        ),
      ]),
    ));
  }
}
