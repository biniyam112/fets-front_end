import 'package:fets_mobile/presentation/pages/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../services/services.dart';
import '../../../../theme/theme.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController password1Controller = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  bool isVisible1 = false;
  bool isVisible2 = false;
  String password = '';
  String confirmPassword = '';
  List<String> errors = [];

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
            SizedBox(
              height: .7.sw,
              width: 1.sw,
              child: Image.asset(
                'assets/images/reset password.jpg',
                width: 1.sw,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacing(10.sp),
                  Text(
                    'Reset\nPassword',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontSize: 30),
                  ),
                  verticalSpacing(20.sp),
                  Text(
                    'Make sure to use \npassword you will remember',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  verticalSpacing(30.sp),
                  CustomPasswordField(
                    onSaved: (value) {
                      password = value!;
                    },
                    onChanged: (value) {
                      if (value.isNotEmpty && errors.contains(kPassNullError)) {
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
                      if (value!.isEmpty && !errors.contains(kPassNullError)) {
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
                    placeHolder: 'new password',
                    editingController: password1Controller,
                    isVisible: isVisible1,
                    changeVisibility: () {
                      setState(() {
                        isVisible1 = !isVisible1;
                      });
                    },
                  ),
                  verticalSpacing(20.sp),
                  CustomPasswordField(
                    onSaved: (value) {
                      setState(() {
                        confirmPassword = value!;
                      });
                    },
                    onChanged: (value) {
                      if (confirmPassword == password &&
                          errors.contains(kMatchPassError)) {
                        setState(() {
                          errors.remove(kMatchPassError);
                        });
                        return '';
                      }
                      setState(() {
                        confirmPassword = value;
                      });
                      return null;
                    },
                    validator: (value) {
                      if (confirmPassword != password &&
                          !errors.contains(kMatchPassError)) {
                        setState(() {
                          errors.add(kMatchPassError);
                        });
                        return '';
                      } else if (confirmPassword != password &&
                          errors.contains(kMatchPassError)) {
                        return '';
                      }
                      return null;
                    },
                    placeHolder: 'comfirm password',
                    editingController: password2Controller,
                    isVisible: isVisible2,
                    changeVisibility: () {
                      setState(() {
                        isVisible2 = !isVisible2;
                      });
                    },
                  ),
                  verticalSpacing(40.sp),
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
