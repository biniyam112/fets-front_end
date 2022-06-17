import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Search Results",
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
              Text(
                "43 results",
                style: TextStyle(
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Column(children: [
                ...List.generate(
                  3,
                  (index) {
                    return const SearchResultTile();
                  },
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
