import 'package:fets_mobile/presentation/pages/pages.dart';
import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../services/services.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

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
                  const CustomOtpField(),
                  verticalSpacing(30.sp),
                  SizedBox(
                    height: 50.sp,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(
                            context, MyDonationsScreen.route);
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
