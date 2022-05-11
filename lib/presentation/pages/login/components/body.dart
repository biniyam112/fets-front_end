import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../services/services.dart';
import '../../../../theme/theme.dart';
import '../../pages.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String password = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            verticalSpacing(10.sp),
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
                    'Log in',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontSize: 30),
                  ),
                  verticalSpacing(20.sp),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          onChanged: (value) {
                            if (value.isNotEmpty &&
                                errors.contains(kEmailNullError)) {
                              setState(() {
                                errors.remove(kEmailNullError);
                              });
                              return '';
                            } else if (emailValidatorRegExp.hasMatch(value) &&
                                errors.contains(kInvalidEmailError)) {
                              setState(() {
                                errors.remove(kInvalidEmailError);
                              });
                              return '';
                            }
                            setState(() {
                              email = value;
                            });

                            return null;
                          },
                          validator: (value) {
                            if (value!.isEmpty &&
                                !errors.contains(kEmailNullError)) {
                              setState(() {
                                errors.add(kEmailNullError);
                              });
                              return '';
                            } else if (!emailValidatorRegExp.hasMatch(value) &&
                                !errors.contains(kInvalidEmailError)) {
                              setState(() {
                                errors.add(kInvalidEmailError);
                              });
                              return '';
                            } else if ((value.isEmpty &&
                                    errors.contains(kEmailNullError)) ||
                                (!emailValidatorRegExp.hasMatch(value) &&
                                    errors.contains(kInvalidEmailError))) {
                              return '';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            email = value!;
                          },
                          placeHolder: 'Email',
                          inputType: TextInputType.emailAddress,
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(18),
                            child: Icon(
                              Icons.alternate_email_rounded,
                            ),
                          ),
                          editingController: emailController,
                        ),
                        verticalSpacing(12.sp),
                        CustomPasswordField(
                          onSaved: (value) {
                            password = value!;
                          },
                          onChanged: (value) {
                            if (value.isNotEmpty &&
                                errors.contains(kPassNullError)) {
                              setState(() {
                                errors.remove(kPassNullError);
                              });
                              return '';
                            }
                            setState(() {
                              password = value;
                            });

                            return null;
                          },
                          validator: (value) {
                            if (value!.isEmpty &&
                                !errors.contains(kPassNullError)) {
                              setState(() {
                                errors.add(kPassNullError);
                              });
                              return '';
                            } else if (value.isEmpty &&
                                errors.contains(kPassNullError)) {
                              return '';
                            }
                            return null;
                          },
                          placeHolder: 'password',
                          editingController: passwordController,
                          isVisible: isVisible,
                          changeVisibility: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  verticalSpacing(10.sp),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, ForogtPassword.route);
                      },
                      child: Text(
                        'Forgot password?',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                      ),
                    ),
                  ),
                  FormFieldErrors(errors: errors),
                  verticalSpacing(30.sp),
                  SizedBox(
                    height: 50.sp,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() &
                            errors.isEmpty) {
                          Navigator.pushNamed(context, OtpScreen.route);
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                      ),
                      child: Text(
                        'Log in',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  verticalSpacing(4.sp),
                  Row(
                    children: [
                      Text(
                        'Don\'t have account?',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: lightTextColor),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpScreen.route);
                        },
                        child: Text(
                          'Sign up',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor,
                                  ),
                        ),
                      ),
                    ],
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
