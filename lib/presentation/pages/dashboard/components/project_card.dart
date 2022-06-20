import 'package:fets_mobile/features/models/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../pages.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({Key? key, required this.project}) : super(key: key);
  final Project project;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProjectDetails.route,
          arguments: project,
        );
      },
      child: Stack(children: [
        Container(
          margin: EdgeInsets.only(top: 24.h, right: 12.w),
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          constraints: BoxConstraints.expand(
            height: 190.h,
            width: 165.w,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10.w),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.only(top: 30.h),
                title: Text(project.name,
                    style: TextStyle(
                        fontSize: 11.sp, fontWeight: FontWeight.w700)),
                subtitle: Text(
                  DateTime.fromMicrosecondsSinceEpoch(project.createdAt.toInt())
                      .toString(),
                  style: TextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade400),
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: "\$ ${project.fundedMoney}",
                        style: TextStyle(
                            fontSize: 10.sp, fontWeight: FontWeight.w600)),
                    TextSpan(
                      text: " of  ${project.estimatedBudget}",
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.h),
                child: LinearProgressIndicator(
                  value: (project.fundedMoney.toDouble() /
                          project.estimatedBudget.toDouble())
                      .toDouble(),
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location',
                        style: TextStyle(
                            fontSize: 9.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        project.location,
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Estimated duration',
                        style: TextStyle(
                            fontSize: 9.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        DateFormat.yM().format(
                            DateTime.fromMillisecondsSinceEpoch(
                                project.estimatedDuration.toInt())),
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.w),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.w),
            child: Image.asset(
              'assets/images/featured.jpg',
              height: 85.h,
              width: 140.w,
              fit: BoxFit.cover,
            ),
          ),
        )
      ]),
    );
  }
}
