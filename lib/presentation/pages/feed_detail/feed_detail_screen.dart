import 'package:fets_mobile/presentation/components/components.dart';
import 'package:fets_mobile/presentation/pages/feed_detail/feed_detail.dart';
import 'package:fets_mobile/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedDetailScreen extends StatelessWidget {
  const FeedDetailScreen({Key? key}) : super(key: key);

  static const route = "feed-detail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: AppBar(
              leading: CustomBackButton(
                onPress: () {
                  Navigator.pop(context);
                },
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: backgroundColor,
              actions: [
                Container(
                  constraints:
                      BoxConstraints.expand(height: 40.sp, width: 45.sp),
                  margin: EdgeInsets.symmetric(
                    horizontal: 15.w,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.sp))),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark_outline,
                      color: lightTextColor,
                    ),
                  ),
                )
              ]),
        ),
      ),
      body: const Body(),
    );
  }
}
