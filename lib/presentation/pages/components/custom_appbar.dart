import 'package:fets_mobile/presentation/pages/pages.dart';
import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSize customAppBar(
  BuildContext context, {
  String title = '',
  bool noTitle = false,
  Color background = backgroundColor,
}) {
  return PreferredSize(
    preferredSize: Size(
      1.sw,
      60.sp,
    ),
    child: AppBar(
      elevation: 0,
      backgroundColor: background,
      leading: CustomBackButton(
        onPress: () => Navigator.pop(context),
      ),
      title: noTitle
          ? const SizedBox()
          : Text(
              title,
              style: Theme.of(context).textTheme.headline4,
            ),
      centerTitle: true,
    ),
  );
}
