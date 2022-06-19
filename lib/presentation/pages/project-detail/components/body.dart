import 'package:fets_mobile/features/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.project}) : super(key: key);
  final Project project;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProjectOverview(
              projectDescription: project.description,
            ),
            SubProjects(
              project: project,
            )
          ],
        ),
      ),
    );
  }
}
