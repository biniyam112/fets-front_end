import 'package:fets_mobile/presentation/pages/pages.dart';
import 'package:fets_mobile/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeedTile extends StatelessWidget {
  const FeedTile({Key? key}) : super(key: key);
  static const arrowforward =
      IconData(0xe15e, fontFamily: 'MaterialIcons', matchTextDirection: true);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, FeedDetailScreen.route);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        margin: EdgeInsets.only(bottom: 20.h),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.sp))),
        constraints: BoxConstraints.expand(height: 330.h, width: 400.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 9.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Help to restore the forest",
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(
            height: 150.h,
            width: 300.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.w),
              child: Image.asset(
                "assets/images/restore_forest.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Text(
              'In publishing and graphic design, Lorem ipsum is  text commonly used to demonstrate the visual of or a typeface without relying on meaningful this may be used as a placeholder before the final is. ',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: lightTextColor,
                fontSize: 13.sm,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Row(
              children: [
                Text.rich(TextSpan(children: [
                  WidgetSpan(
                      child: Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: Icon(
                            Icons.thumb_up_sharp,
                            color: primaryColor,
                            size: 13.sp,
                          ))),
                  TextSpan(
                      text: "1.2k",
                      style: TextStyle(
                          color: lightTextColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 9.sp))
                ])),
                SizedBox(
                  width: 20.w,
                ),
                Text.rich(TextSpan(children: [
                  WidgetSpan(
                    child: SvgPicture.asset(
                      'assets/icons/forward_share.svg',
                      height: 12.h,
                      color: lightTextColor,
                    ),
                  ),
                  TextSpan(
                      text: " 20",
                      style: TextStyle(
                          fontSize: 9.sp,
                          color: lightTextColor,
                          fontWeight: FontWeight.bold))
                ]))
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: Text(
                  "4 h 23 mins",
                  style: TextStyle(
                      fontSize: 11.sp,
                      color: lightTextColor,
                      fontWeight: FontWeight.w100),
                ),
              ))
        ]),
      ),
    );
  }
}
