import 'package:fets_mobile/features/models/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'donate_project_progress.dart';
import 'donate_project_report.dart';

class DonatedProjectCard extends StatelessWidget {
  const DonatedProjectCard({Key? key, required this.projects})
      : super(key: key);
  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 11.h),
      constraints: BoxConstraints.expand(width: 350.w, height: 180.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.w))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DonateProjectReport(projects: projects),
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(3.w)),
              child: VerticalDivider(
                width: 20.w,
                thickness: 3.w,
              )),
          DonateProjectProgress(projects: projects),
        ],
      ),
    );
  }
}
