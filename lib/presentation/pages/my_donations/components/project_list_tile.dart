import 'package:fets_mobile/features/models/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../services/services.dart';
import '../../../../theme/theme.dart';
import '../../pages.dart';

class ProjectListTile extends StatelessWidget {
  const ProjectListTile({
    Key? key,
    required this.project,
  }) : super(key: key);
  final Project project;
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
                      'assets/images/project_default_image.jpg',
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
                        project.name,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      verticalSpacing(6.sp),
                      Text(
                        '\$ ${project.estimatedBudget}',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                      ),
                      verticalSpacing(1.sp),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: primaryColor,
                          ),
                          horizontalSpacing(20.sp),
                          Text(
                            project.location,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: lightTextColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpacing(8.sp),
          ],
        ),
      ),
    );
  }
}
