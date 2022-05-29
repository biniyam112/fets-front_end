import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/search_bar.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: Padding(
          padding: EdgeInsets.only(top: 7.h),
          child: AppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            backgroundColor: backgroundColor,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SearchBar(),
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: const Icon(
                    Icons.notification_add,
                    color: Color.fromARGB(255, 129, 125, 125),
                  ),
                )
              ],
            ),
            actions: const [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/images/signup.jpg"),
              )
            ],
          ),
        ),
        preferredSize: Size.fromHeight(2.h));
  }
}
