import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Education extends StatelessWidget {
  const Education({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Education',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold)),
            TextButton(
                onPressed: () {},
                child: Text(
                  "See all",
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w700),
                ))
          ],
        ),
        SizedBox(height: 7.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              // children: const [ProjectCard(),ProjectCard(),ProjectCard()],
              ),
        )
      ],
    );
  }
}
