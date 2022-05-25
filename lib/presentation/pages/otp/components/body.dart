import 'package:fets_mobile/presentation/pages/pages.dart';
import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../services/services.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> errors = [];
  String pin1 = '';
  String pin2 = '';
  String pin3 = '';
  String pin4 = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 1.sw,
              width: 1.sw,
              child: Image.asset(
                'assets/images/otp.jpg',
                width: 1.sw,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacing(20),
                  Text(
                    'Verification Code',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontSize: 30),
                  ),
                  verticalSpacing(10.sp),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(height: 1.5),
                      children: [
                        TextSpan(
                          text: 'A 4 digit code has been sent to \n',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: lightTextColor),
                        ),
                        TextSpan(
                          text: '+1234567893',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ),
                  verticalSpacing(30.sp),
                  CustomOtpField(
                    pin1: (value) {
                      pin1 = value;
                      if (pin1.isNotEmpty &&
                          pin2.isNotEmpty &&
                          pin3.isNotEmpty &&
                          pin4.isNotEmpty) {
                        setState(() {
                          errors.remove(kInvalidotpError);
                        });
                      }
                    },
                    pin2: (value) {
                      pin2 = value;
                      if (pin1.isNotEmpty &&
                          pin2.isNotEmpty &&
                          pin3.isNotEmpty &&
                          pin4.isNotEmpty) {
                        setState(() {
                          errors.remove(kInvalidotpError);
                        });
                      }
                    },
                    pin3: (value) {
                      pin3 = value;
                      if (pin1.isNotEmpty &&
                          pin2.isNotEmpty &&
                          pin3.isNotEmpty &&
                          pin4.isNotEmpty) {
                        setState(() {
                          errors.remove(kInvalidotpError);
                        });
                      }
                    },
                    pin4: (value) {
                      pin4 = value;
                      if (pin1.isNotEmpty &&
                          pin2.isNotEmpty &&
                          pin3.isNotEmpty &&
                          pin4.isNotEmpty) {
                        setState(() {
                          errors.remove(kInvalidotpError);
                        });
                      }
                    },
                  ),
                  FormFieldErrors(errors: errors),
                  verticalSpacing(30.sp),
                  SizedBox(
                    height: 50.sp,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (pin1.isEmpty ||
                            pin2.isEmpty ||
                            pin3.isEmpty ||
                            pin4.isEmpty) {
                          if (!errors.contains(kInvalidotpError)) {
                            setState(() {
                              errors.add(kInvalidotpError);
                            });
                          }
                        } else {
                          Navigator.popAndPushNamed(
                              context, MyDonationsScreen.route);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                      ),
                      child: Text(
                        'Submit',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  verticalSpacing(30.sp),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
