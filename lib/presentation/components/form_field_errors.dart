import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../services/services.dart';
import '../../../theme/theme.dart';

class FormFieldErrors extends StatelessWidget {
  const FormFieldErrors({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (errors.isEmpty) ? EdgeInsets.zero : EdgeInsets.only(top: 20.sp),
      child: Column(
        children: [
          ...List.generate(
            errors.length,
            (index) => Padding(
              padding: const EdgeInsets.all(3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Icon(
                      CupertinoIcons.clear_circled,
                      color: errorColor,
                      size: 20,
                    ),
                  ),
                  horizontalSpacing(6.sp),
                  Expanded(
                    child: Text(
                      errors[index],
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: errorColor,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
