import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/theme.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    Key? key,
    required this.placeHolder,
    required this.prefixIcon,
    required this.editingController,
  }) : super(key: key);
  final String placeHolder;
  final Widget prefixIcon;
  final TextEditingController editingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: textfieldBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: editingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: prefixIcon,
          hintText: placeHolder,
          hintStyle: Theme.of(context).textTheme.headline5!.copyWith(
                color: lightTextColor,
              ),
        ),
      ),
    );
  }
}

class CustomPasswordField extends StatelessWidget {
  const CustomPasswordField({
    Key? key,
    required this.placeHolder,
    required this.editingController,
    required this.isVisible,
  }) : super(key: key);
  final String placeHolder;
  final TextEditingController editingController;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: textfieldBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: editingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(18),
            child: SvgPicture.asset('assets/icons/Lock.svg'),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(18),
            child: IconButton(
              onPressed: () {},
              icon: !isVisible
                  ? const Icon(
                      CupertinoIcons.eye,
                      color: lightTextColor,
                    )
                  : const Icon(
                      CupertinoIcons.eye_slash,
                      color: lightTextColor,
                    ),
            ),
          ),
          hintText: placeHolder,
          hintStyle: Theme.of(context).textTheme.headline5!.copyWith(
                color: lightTextColor,
              ),
        ),
      ),
    );
  }
}

class CustomOtpField extends StatelessWidget {
  const CustomOtpField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
