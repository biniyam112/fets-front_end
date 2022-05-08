import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
    required this.onPress,
  }) : super(key: key);
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.sp,
      width: 40.sp,
      child: ElevatedButton(
        
        child: const Icon(
          CupertinoIcons.back,
          color: lightTextColor,
        ),
        onPressed: onPress,
        style: ButtonStyle(
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