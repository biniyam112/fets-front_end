import 'package:fets_mobile/presentation/pages/search/search.dart';
import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {Key? key, required this.isVisible, required this.onPressedCallback})
      : super(key: key);

  final VoidCallback onPressedCallback;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.h),
      child: AppBar(
        titleSpacing: 0,
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            const SearchBarWidget(),
            Container(
              width: 40.w,
              height: 32.h,
              decoration: BoxDecoration(
                  color: isVisible ? Colors.blue : const Color(0xFFDADBE1),
                  borderRadius: BorderRadius.all(Radius.circular(7.sp))),
              margin: EdgeInsets.only(left: 10.w),
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.h),
              child: IconButton(
                  onPressed: onPressedCallback,
                  icon: const Icon(Icons.tune_outlined),
                  color: isVisible ? Colors.white : Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
