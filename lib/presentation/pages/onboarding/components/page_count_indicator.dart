import 'package:fets_mobile/services/constants.dart';
import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageCountIndicator extends StatelessWidget {
  const PageCountIndicator({
    Key? key,
    this.isActive = false,
    this.shape = BoxShape.rectangle,
  }) : super(key: key);
  final bool isActive;
  final BoxShape shape;
  // final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 4.sp,
      ),
      child: AnimatedContainer(
        duration: fastAnimation,
        curve: Curves.linear,
        height: 12.sp,
        width: 5.sp,
        decoration: BoxDecoration(
          shape: shape,
          borderRadius: shape != BoxShape.circle
              ? BorderRadius.circular(
                  6.sp,
                )
              : null,
          color: isActive ? primaryColor : Colors.grey,
        ),
      ),
    );
  }
}
