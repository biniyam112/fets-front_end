import 'package:fets_mobile/presentation/pages/project-detail/components/components.dart';
import 'package:fets_mobile/presentation/pages/report/report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubProjects extends StatelessWidget {
  const SubProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "subprojects",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
        ),
        SizedBox(
          height: 10.h,
        ),
        const SubProjectTile(),
        const SubProjectTile(),
        const SubProjectTile(),
        const SubProjectTile(),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, ReportScreen.route);
            },
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.h)),
            child: Text(
              "Generate Project",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
            )),
        SizedBox(
          height: 10.h,
        )
      ],
    );
  }
}
