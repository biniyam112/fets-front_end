import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Stack(children: [
        Container(
          margin: EdgeInsets.only(top: 24.h,right: 12.w),
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
                title: Text("Elecricity supply in Kototo",
                    style:
                        TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w700)),
                subtitle: Text(
                  "Created at Feb 01 2022",
                  style: TextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade400),
                ),
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "\$812,655",
                    style:
                        TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600)),
                TextSpan(
                    text: " of  1,020,000",
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w600))
              ])),
              SizedBox(
                height: 5.h,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.h),
                child: const LinearProgressIndicator(
                  value: 0.3,
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
