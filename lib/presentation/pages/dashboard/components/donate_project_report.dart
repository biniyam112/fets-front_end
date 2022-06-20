import 'package:fets_mobile/features/models/project.dart';
import 'package:fets_mobile/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonateProjectReport extends StatelessWidget {
  const DonateProjectReport({Key? key, required this.projects})
      : super(key: key);
  final List<Project> projects;

  int completedProjects() {
    int completedCount = 0;
    for (var i = 0; i < projects.length; i++) {
      if (projects[i].status.toInt() == 2) {
        completedCount += 1;
      }
    }
    return completedCount;
  }

  double calculateSpending() {
    double spending = 0;
    for (var i = 0; i < projects.length; i++) {
      spending += projects[i].fundedMoney.toDouble();
    }
    return spending;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(children: [
          WidgetSpan(
              child: Icon(
            Icons.refresh,
            color: Colors.grey.shade400,
          )),
          WidgetSpan(
              child: Text(
            " last updated 1 minute ago",
            style: TextStyle(
                fontSize: 10.5.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade400),
            // style: TextStyle(color: Colors.black),
          ))
        ])),
        SizedBox(height: 10.h),
        Text("Doanted Projects",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp)),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '${completedProjects().toInt() / projects.length} %',
              style: TextStyle(
                  color: Colors.grey.shade400, fontWeight: FontWeight.w600),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              width: 130.w,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.w)),
                child: LinearProgressIndicator(
                  value: projects.isNotEmpty
                      ? completedProjects().toInt() / projects.length
                      : 0,
                  minHeight: 4.5.h,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10.h),
        Text(
          'you have funded ${projects.length} projects',
          style: TextStyle(fontSize: 11.sp),
        ),
        SizedBox(height: 4.h),
        Text(
          "spend :  \$ ${calculateSpending()}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 11.sp,
          ),
        ),
        verticalSpacing(2.sp),
      ],
    );
  }
}
