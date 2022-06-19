import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectOverview extends StatelessWidget {
  const ProjectOverview({Key? key, required this.projectDescription})
      : super(key: key);

  final String projectDescription;

  @override
  Widget build(BuildContext context) {
    print(projectDescription);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Project Overview',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 10.h),
          Text(projectDescription,
              // textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.grey.shade400)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size.zero,
                  padding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.sp))),
              onPressed: () {},
              child: Text(
                "read all",
                style: TextStyle(color: Colors.black, fontSize: 11.sp),
              ))
        ],
      ),
    );
  }
}
