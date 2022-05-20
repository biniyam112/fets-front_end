import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      height: 35.h,
      // padding: EdgeInsets.only(right: 20.w),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.sp),
        child: TextField(
          onSubmitted: (value) {},
          autofocus: true,
          controller: _controller,
          keyboardType: TextInputType.text,
          cursorColor: Color.fromARGB(255, 112, 112, 112),
          textAlignVertical: TextAlignVertical.center,
          onChanged: (value) {},
          style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 15.sp,
              color: Colors.black),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10.h),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.grey[600]),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}
