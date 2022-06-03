import 'package:fets_mobile/features/authentication/model/signin_model.dart';
import 'package:fets_mobile/features/features.dart';
import 'package:fets_mobile/services/error_messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../services/services.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';
import '../../pages.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String password = '';
  String userName = '';
  User user = User();

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
                          placeHolder: 'username',
                          editingController: usernameController,
                          inputType: TextInputType.name,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(18),
                            child: SvgPicture.asset(
                              'assets/icons/user.svg',
                            ),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty &&
                                errors.contains(kUserNameNullError)) {
                              setState(() {
                                errors.remove(kUserNameNullError);
                              });
                              return '';
                            }
                            return null;
                          },
                          validator: (value) {
                            user = user.copywith(
                              userName: value,
                            );
                            if (value!.isEmpty &&
                                !errors.contains(kUserNameNullError)) {
                              setState(() {
                                errors.add(kUserNameNullError);
                              });
                              return '';
                            }
                            return null;
                          },
                        ),
                        verticalSpacing(12.sp),
                        CustomPasswordField(
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
                            user = user.copywith(
                              password: value,
                            );
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
                  BlocConsumer<AuthUserBloc, AuthUserState>(
                    listener: (context, state) {
                      if (state is UserAuthFailed) {
                        setState(() {
                          errors.add(kUserLogInFailedError);
                        });
                      }
                      if (state is UserSignedInSuccessfully) {
                        Navigator.pushNamed(context, DashboardScreen.route);
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthenticatingUser) {
                        return Center(
                          child: SizedBox(
                            height: 32.sp,
                            width: 32.sp,
                            child: const CircularProgressIndicator(
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
                            setState(() {
                              errors.remove(kUserLogInFailedError);
                            });
                            if (_formKey.currentState!.validate() &
                                errors.isEmpty) {
                              BlocProvider.of<AuthUserBloc>(context).add(
                                SignInEvent(
                                  signinModel: SigninModel(
                                    username: user.userName!,
                                    password: user.password!,
                                  ),
                                ),
                              );
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
                      );
                    },
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
