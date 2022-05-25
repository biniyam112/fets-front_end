import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedDetailHeader extends StatelessWidget {
  const FeedDetailHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 220.h,
          width: 350.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.w),
            child: Image.asset(
              "assets/images/restore_forest.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            // constraints: BoxConstraints.expand(
            //   height: 20.h,
            //   width: 50.w,
            // ),
            margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 4.w),
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            decoration: BoxDecoration(
                color: const Color(0xFFDADBE1),
                borderRadius: BorderRadius.all(Radius.circular(10.sp))),
            child: const Text(
              "#forest",
              style: TextStyle(color: Color(0xFF687087)),
            ),
          ),
        )
      ],
    );
  }
}
