import 'package:fets_mobile/features/features.dart';
import 'package:fets_mobile/presentation/pages/feed_detail/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.apiFeedData}) : super(key: key);

  final APIFeedData apiFeedData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            FeedDetailHeader(
              apiFeedData: apiFeedData,
            ),
            FeedDetailDescription(
              apiFeedData: apiFeedData,
            )
          ],
        ),
      ),
    );
  }
}
