import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../services/services.dart';
import '../../../../theme/theme.dart';
import '../../pages.dart';

class ProjectListTile extends StatelessWidget {
  const ProjectListTile({
    Key? key,
    required this.title,
    required this.budget,
    required this.completedSubprojects,
    required this.completedTasks,
    required this.imagePath,
    required this.percentage,
    required this.totalSubprojects,
    required this.totalTasks,
  }) : super(key: key);
  final String title, imagePath;
  final int completedSubprojects, completedTasks, totalSubprojects, totalTasks;
  final double budget, percentage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        ProjectDetails.route,
      ),
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [topShadow, bottomShadow],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.sp),
                      boxShadow: const [topShadow, bottomShadow],
                    ),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                horizontalSpacing(12.sp),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      verticalSpacing(6.sp),
                      Text(
                        '\$ $budget',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                      ),
                      verticalSpacing(1.sp),
                      Text(
                        '$completedSubprojects of 8 subprojects completed',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: lightTextColor),
                      ),
                      Text(
                        '$completedTasks of 8 tasks completed',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: lightTextColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpacing(8.sp),
            Row(
              children: [
                Expanded(
                  child: Opacity(
                    opacity: 1.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${percentage * 100}',
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                            fontSize: 14,
                          ),
                        ),
                        horizontalSpacing(1.sp),
                        const Icon(
                          Icons.percent_rounded,
                          color: primaryColor,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                horizontalSpacing(10.sp),
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      backgroundColor: shadowColor,
                      color: primaryColor,
                      value: .6,
                      minHeight: 8.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
