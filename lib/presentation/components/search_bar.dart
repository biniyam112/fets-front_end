import 'package:fets_mobile/presentation/pages/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 245.w,
      height: 34.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(alignment: Alignment.centerRight, children: [
          TextField(
            readOnly: true,
            onTap: () {
              Navigator.pushNamed(context, SearchScreen.route);
            },
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 20.sp,
            ),
            decoration: InputDecoration(
              // suffixStyle: TextStyle(color: Colors.black),
              // suffixIconConstraints: BoxConstraints(),
              contentPadding: EdgeInsets.symmetric(vertical: 10.h),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.grey[600], fontSize: 17.sp),
              filled: true,
              fillColor: Colors.white,
              prefixIcon:
                  Icon(Icons.search, color: Colors.grey[600], size: 20.w),
            ),
          ),
        ]),
      ),
    );
  }
}
