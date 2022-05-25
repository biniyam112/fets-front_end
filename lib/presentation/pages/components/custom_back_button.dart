import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/theme.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
    required this.onPress,
  }) : super(key: key);
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      height: 50.sp,
      width: 52.sp,
      child: ElevatedButton(
        child: const Icon(
          CupertinoIcons.back,
          color: lightTextColor,
        ),
        onPressed: onPress,
        style: ButtonStyle(
          shadowColor: MaterialStateProperty.all(shadowColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            Colors.white,
          ),
        ),
      ),
    );
  }
}
