import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterTagWidget extends StatefulWidget {
  final String tagName;
  const FilterTagWidget({Key? key, required this.tagName}) : super(key: key);

  @override
  State<FilterTagWidget> createState() => _FilterTagWidgetState();
}

class _FilterTagWidgetState extends State<FilterTagWidget> {
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: Container(
          height: 25.h,
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
              color: Color(0xFFDADBE1),
              borderRadius: BorderRadius.all(Radius.circular(7.sp))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              FittedBox(
                  child: Text(
                widget.tagName,
                style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6F6262)),
                textAlign: TextAlign.end,
              )),
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  alignment: Alignment.centerRight,
                  color: Color(0xFF6F6262),
                  onPressed: () {
                    setState(() {
                      _isVisible = !_isVisible;
                    });
                  },
                  icon: Icon(
                    Icons.close,
                    size: 13.sp,
                  ))
            ],
          )),
    );
  }
}
