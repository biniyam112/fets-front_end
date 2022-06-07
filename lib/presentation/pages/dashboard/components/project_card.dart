import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../project-detail/project_detail.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    required this.name,
    required this.description,
    required this.location,
    required this.estimatedBudget,
    required this.fundedBudget,
    required this.estimatedDuration,
    required this.createdAt,
    required this.companyId,
    required this.accountNumber,
    required this.status,
  }) : super(key: key);
  final String name, description, location, companyId, accountNumber;
  final BigInt estimatedBudget,
      fundedBudget,
      estimatedDuration,
      createdAt,
      status;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProjectDetailScreen.route);
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
              borderRadius: BorderRadius.all(Radius.circular(10.w))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.only(top: 30.h),
                title: Text(name,
                    style: TextStyle(
                        fontSize: 11.sp, fontWeight: FontWeight.w700)),
                subtitle: Text(
                  DateTime.fromMicrosecondsSinceEpoch(createdAt.toInt())
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
                        text: "\$ $fundedBudget",
                        style: TextStyle(
                            fontSize: 10.sp, fontWeight: FontWeight.w600)),
                    TextSpan(
                      text: " of  $estimatedBudget",
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
                  value: (fundedBudget / estimatedBudget).toDouble(),
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Donors',
                        style: TextStyle(
                            fontSize: 9.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        '85',
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Average donation',
                        style: TextStyle(
                            fontSize: 9.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        '\$10K',
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
