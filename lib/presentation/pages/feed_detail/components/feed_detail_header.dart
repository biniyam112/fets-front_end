import 'package:fets_mobile/features/features.dart';
import 'package:fets_mobile/helper/network_image_helper.dart';
import 'package:fets_mobile/helper/url_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedDetailHeader extends StatelessWidget {
  const FeedDetailHeader({Key? key, required this.apiFeedData})
      : super(key: key);
  final APIFeedData apiFeedData;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 220.h,
          width: 350.w,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10.w),
              child: NetworkImageHelper.getNetworkFadeImage(
                  "$baseUrl/uploads/${apiFeedData.image.split('\\')[1].trim()}")),
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
