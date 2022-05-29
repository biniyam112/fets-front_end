import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/material.dart';

import 'custom_back_button.dart';

AppBar customAppBar(
  BuildContext context, {
  String title = '',
  bool noTitle = false,
  Color background = backgroundColor,
}) {
  return AppBar(
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
  );
}
