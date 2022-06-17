import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConnectionErrorIndicator extends StatelessWidget {
  const ConnectionErrorIndicator({
    required this.title,
    this.message,
    this.onTryAgain,
    Key? key,
  }) : super(key: key);
  final String title;
  final String? message;
  final VoidCallback? onTryAgain;

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: false,
      shrinkWrap: true,
      padding: EdgeInsets.only(
        top: 10.h,
      ),
      children: [
        Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              message!,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 48.h),
          ],
        ),
        SizedBox(height: .32.sh),
        SizedBox(
          height: 50.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: ElevatedButton.icon(
              onPressed: onTryAgain,
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              label: Text(
                'Try Again',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
