import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'filter_tag_widget.dart';

class FilterTagList extends StatelessWidget {
  final bool isVisible;
  const FilterTagList({required this.isVisible, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 8.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            FilterTagWidget(tagName: "Projects"),
            FilterTagWidget(tagName: "companies"),
            FilterTagWidget(tagName: "feeds"),
          ],
        ),
      ),
    );
  }
}
