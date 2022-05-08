import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DonateProjectReport extends StatelessWidget {
  const DonateProjectReport({Key? key}) : super(key: key);

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
              "40%",
              style: TextStyle(
                  color: Colors.grey.shade400, fontWeight: FontWeight.w600),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              width: 130.w,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.w)),
                child: LinearProgressIndicator(
                  // backgroundColor: Colors.grey.shade300,
                  value: 0.4,
                  minHeight: 4.5.h,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10.h),
        Text(
          'you have funded 13 projects',
          style: TextStyle(fontSize: 10.sp),
        ),
        SizedBox(height: 10.h),
        Text("spend :\$ 127,854",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp)),
        Text("People affected : 207,034",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp))
      ],
    );
  }
}
