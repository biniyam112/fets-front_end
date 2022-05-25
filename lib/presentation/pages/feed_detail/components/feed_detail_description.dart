import 'package:fets_mobile/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedDetailDescription extends StatelessWidget {
  const FeedDetailDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            "Help to restore forest",
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700),
          ),
          subtitle: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Text(
              "Apr 20,2020 - 4 h 23 min ago",
              style: TextStyle(fontSize: 12.sp, color: lightTextColor),
            ),
          ),
        ),
        Text(
          'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available. In publishing and graphic design, Lorem ipsum is a placeholder  text commonly used to demonstrate the visual form of a documentor a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available. In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a documentor a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available. '
          '',
          textAlign: TextAlign.justify,
          style:
              TextStyle(color: lightTextColor, fontSize: 12.sp, height: 1.2.h),
        ),
        Padding(
          padding: EdgeInsets.only(top: 25.h),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.h)),
              onPressed: () {},
              child: const Text(
                "Go to project",
                style: TextStyle(fontWeight: FontWeight.w700),
              )),
        )
      ],
    );
  }
}
