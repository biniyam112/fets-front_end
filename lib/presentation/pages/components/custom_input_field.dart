import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../theme/theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.placeHolder,
    required this.prefixIcon,
    required this.editingController,
    required this.inputType,
    required this.onChanged,
    required this.onSaved,
    required this.validator,
  }) : super(key: key);
  final String placeHolder;
  final Widget prefixIcon;
  final TextEditingController editingController;
  final TextInputType inputType;
  final Function(String? value) onSaved;
  final Function(String value) onChanged;
  final String? Function(String? value) validator;

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
        keyboardType: inputType,
        controller: editingController,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
          errorStyle: const TextStyle(height: 0),
          contentPadding: EdgeInsets.zero,
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
    required this.changeVisibility,
    required this.onSaved,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);
  final String placeHolder;
  final TextEditingController editingController;
  final bool isVisible;
  final GestureTapCallback changeVisibility;
  final Function(String? value) onSaved;
  final Function(String value) onChanged;
  final String? Function(String? value) validator;

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
        keyboardType: TextInputType.visiblePassword,
        controller: editingController,
        onChanged: onChanged,
        validator: validator,
        onSaved: onSaved,
        obscureText: !isVisible,
        style: Theme.of(context).textTheme.headline5!.copyWith(
              fontWeight: FontWeight.w600,
              letterSpacing: .4,
              color: Colors.black.withOpacity(.7),
            ),
        decoration: InputDecoration(
          errorStyle: const TextStyle(height: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(18),
            child: SvgPicture.asset('assets/icons/Lock.svg'),
          ),
          suffixIcon: IconButton(
            onPressed: changeVisibility,
            splashRadius: 1,
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
  const CustomOtpField({
    Key? key,
    required this.pin1,
    required this.pin2,
    required this.pin3,
    required this.pin4,
  }) : super(key: key);
  final Function(String) pin1, pin2, pin3, pin4;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 50.sp,
          width: 50.sp,
          child: TextFormField(
            decoration: const InputDecoration(
              errorStyle: TextStyle(height: 0),
            ),
            expands: false,
            onChanged: (value) {
              pin1(value);
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              } else {
                FocusScope.of(context).previousFocus();
              }
            },
            onSaved: (value) {
              pin1(value!);
            },
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp,
                ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
        SizedBox(
          height: 50.sp,
          width: 50.sp,
          child: TextFormField(
            onChanged: (value) {
              pin2(value);
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              } else {
                FocusScope.of(context).previousFocus();
              }
            },
            onSaved: (value) {
              pin2(value!);
            },
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp,
                ),
            decoration: const InputDecoration(
              errorStyle: TextStyle(height: 0),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
        SizedBox(
          height: 50.sp,
          width: 50.sp,
          child: TextFormField(
            onChanged: (value) {
              pin3(value);

              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              } else {
                FocusScope.of(context).previousFocus();
              }
            },
            onSaved: (value) {
              pin3(value!);
            },
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp,
                ),
            decoration: const InputDecoration(
              errorStyle: TextStyle(height: 0),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
        SizedBox(
          height: 50.sp,
          width: 50.sp,
          child: TextFormField(
            onChanged: (value) {
              pin4(value);
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              } else {
                FocusScope.of(context).previousFocus();
              }
            },
            onSaved: (value) {
              pin4(value!);
            },
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp,
                ),
            decoration: const InputDecoration(
              errorStyle: TextStyle(height: 0),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ),
      ],
    );
  }
}
