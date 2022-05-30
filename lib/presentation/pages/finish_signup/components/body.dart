import 'package:fets_mobile/features/authentication/model/signin_model.dart';
import 'package:fets_mobile/presentation/pages/dashboard/dashboard_screen.dart';
import 'package:fets_mobile/presentation/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../../../features/features.dart';
import '../../../../services/services.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';

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
  final GlobalKey<FormState> _formstate = GlobalKey<FormState>();
  User user = Hive.box<User>('users').get('user')!;

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
                    'Finish\n Sign up',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontSize: 30),
                  ),
                  verticalSpacing(12.sp),
                  Text(
                    'Make sure to use \npassword you will remember',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: lightTextColor,
                        ),
                  ),
                  verticalSpacing(30.sp),
                  Form(
                    key: _formstate,
                    child: Column(
                      children: [
                        CustomPasswordField(
                          onChanged: (value) {
                            if (value.isNotEmpty &&
                                errors.contains(kPassNullError)) {
                              setState(() {
                                errors.remove(kPassNullError);
                              });
                              return '';
                            } else if (value.length >= 6 &&
                                errors.contains(kShortPassError)) {
                              setState(() {
                                errors.remove(kShortPassError);
                              });
                            }
                            password = value;

                            return null;
                          },
                          validator: (value) {
                            user = user.copywith(password: password);
                            if (value!.isEmpty &&
                                !errors.contains(kPassNullError)) {
                              setState(() {
                                errors.add(kPassNullError);
                              });
                              return '';
                            } else if (value.length < 6 &&
                                !errors.contains(kShortPassError)) {
                              setState(() {
                                errors.add(kShortPassError);
                              });
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
                        verticalSpacing(12.sp),
                        CustomPasswordField(
                          onChanged: (value) {
                            if (value == password &&
                                errors.contains(kMatchPassError)) {
                              setState(() {
                                errors.remove(kMatchPassError);
                              });
                            }
                            confirmPassword = value;
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
                      ],
                    ),
                  ),
                  FormFieldErrors(errors: errors),
                  verticalSpacing(40.sp),
                  BlocConsumer<AuthUser, AuthUserState>(
                    listener: (BuildContext context, state) {
                      if (state is UserAuthenticated) {
                        // BlocProvider.of<AuthUser>(context).add(SignInEvent(
                        //   signinModel: SigninModel(
                        //     password: user.password!,
                        //     username: user.userName!,
                        //   ),
                        // ));
                      }
                      if (state is UserSignedInSuccessfully) {
                        Navigator.pushNamed(context, DashboardScreen.route);
                      }
                      if (state is UserAuthFailed) {
                        errors.add(state.errorMessage);
                      }
                      if (state is UserAuthFailed) {
                        setState(() {
                          errors.add(kUserSignUpFailedError);
                        });
                      }
                    },
                    builder: (BuildContext context, AuthUserState? state) {
                      if (state is AuthenticatingUser) {
                        return const Center(
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: CircularProgressIndicator(
                              color: primaryColor,
                            ),
                          ),
                        );
                      }
                      return SizedBox(
                        height: 50.sp,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formstate.currentState!.validate() &
                                errors.isEmpty) {
                              BlocProvider.of<AuthUser>(context)
                                  .add(AuthUserEvent(user: user));
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
                      );
                    },
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
