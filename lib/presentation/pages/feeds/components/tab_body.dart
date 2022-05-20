import 'package:fets_mobile/presentation/pages/feeds/feeds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBody extends StatelessWidget {
  const TabBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
        child: Column(children: const [
          FeedTile(),
          FeedTile(),
          FeedTile(),
        ]),
      ),
    );
  }
}
