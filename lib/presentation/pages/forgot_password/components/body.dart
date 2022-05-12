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
  List<String> errors = [];
  String email = '';
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              // height: 1.sw,
              width: 1.sw,
              child: Image.asset(
                'assets/images/forgot password.jpg',
                width: 1.sw,
                height: .7.sw,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Forgot\nPassword?',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontSize: 30),
                  ),
                  verticalSpacing(20.sp),
                  Text(
                    'Please enter the email \naddress associated with your account',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  verticalSpacing(30.sp),
                  Form(
                    key: _formkey,
                    child: CustomTextField(
                      onChanged: (value) {
                        if (value.isNotEmpty &
                            errors.contains(kEmailNullError)) {
                          setState(() {
                            errors.remove(kEmailNullError);
                          });
                        } else if (emailValidatorRegExp.hasMatch(value) &
                            errors.contains(kInvalidEmailError)) {
                          setState(() {
                            errors.remove(kInvalidEmailError);
                          });
                        }
                        email = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty &
                            !errors.contains(kEmailNullError)) {
                          setState(() {
                            errors.add(kEmailNullError);
                          });
                          return '';
                        } else if (!emailValidatorRegExp.hasMatch(value) &
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
                  ),
                  FormFieldErrors(errors: errors),
                  verticalSpacing(30.sp),
                  SizedBox(
                    height: 50.sp,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate() &&
                            errors.isEmpty) {
                          Navigator.pushNamed(context, ResetPassword.route);
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
