import 'package:fets_mobile/presentation/pages/login/login_screen.dart';
import 'package:fets_mobile/presentation/pages/terms_and_conditions/terms_and_conditions.dart';
import 'package:fets_mobile/services/size_config.dart';
import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/components.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 1.sw,
              width: 1.sw,
              child: Image.asset(
                'assets/images/signup.jpg',
                width: 1.sw,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign up',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontSize: 30),
                  ),
                  verticalSpacing(20),
                  CustomInputField(
                    placeHolder: 'Full name',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(18),
                      child: SvgPicture.asset(
                        'assets/icons/user.svg',
                      ),
                    ),
                    editingController: nameController,
                  ),
                  verticalSpacing(20.sp),
                  CustomInputField(
                    placeHolder: 'Phone',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(18),
                      child: SvgPicture.asset(
                        'assets/icons/Phone.svg',
                      ),
                    ),
                    editingController: nameController,
                  ),
                  verticalSpacing(20.sp),
                  CustomInputField(
                    placeHolder: 'Email',
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(18),
                      child: Icon(
                        Icons.alternate_email_rounded,
                      ),
                    ),
                    editingController: nameController,
                  ),
                  verticalSpacing(12.sp),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(height: 1.5.sp),
                      children: [
                        TextSpan(
                          text: 'By signing up you agree to our',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: lightTextColor),
                        ),
                        TextSpan(
                          text: ' terms and conditions',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                  context, TermsAndConditions.route);
                            },
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpacing(30.sp),
                  Row(
                    children: [
                      Text(
                        'Already have account?',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.route);
                        },
                        child: Text(
                          'Login',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpacing(10.sp),
                  SizedBox(
                    height: 50.sp,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                      ),
                      child: Text(
                        'Sign up',
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
