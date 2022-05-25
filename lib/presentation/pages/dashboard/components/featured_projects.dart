import 'package:fets_mobile/presentation/pages/dashboard/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedProjects extends StatelessWidget {
  const FeaturedProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Featured projects',
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
            children: const [ProjectCard(),ProjectCard(),ProjectCard()],
          ),
        )
      ],
    );
  }
}
