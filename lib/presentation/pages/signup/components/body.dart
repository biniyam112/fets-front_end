import 'package:fets_mobile/features/authentication/authentication.dart';
import 'package:fets_mobile/presentation/pages/pages.dart';
import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';

import '../../../../services/services.dart';
import '../../../components/components.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool termsAgreement = false;
  List<String> errors = [];
  String userName = '';
  String phone = '';
  String email = '';
  var userbox = Hive.box('users');
  User user = User();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              verticalSpacing(10.sp),
              SizedBox(
                height: .8.sw,
                width: 1.sw,
                child: Image.asset(
                  'assets/images/signup.jpg',
                  width: 1.sw,
                  fit: BoxFit.cover,
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
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            onChanged: (value) {
                              if (value.isNotEmpty &&
                                  errors.contains(kFullNameNullError)) {
                                setState(() {
                                  errors.remove(kFullNameNullError);
                                });
                                return '';
                              }
                              userName = value;
                              return null;
                            },
                            validator: (value) {
                              if (value!.isEmpty &&
                                  !errors.contains(kFullNameNullError)) {
                                setState(() {
                                  errors.add(kFullNameNullError);
                                });
                                return '';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              userName = value!;
                              user = user.copywith(userName: userName);
                            },
                            placeHolder: 'User name',
                            inputType: TextInputType.name,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(18),
                              child: SvgPicture.asset(
                                'assets/icons/user.svg',
                              ),
                            ),
                            editingController: nameController,
                          ),
                          verticalSpacing(12.sp),
                          CustomTextField(
                            onChanged: (value) {
                              if (value.isNotEmpty &&
                                  errors.contains(kphoneNumberNullError)) {
                                setState(() {
                                  errors.remove(kphoneNumberNullError);
                                });
                                return '';
                              }
                              setState(() {
                                phone = value;
                              });

                              return null;
                            },
                            validator: (value) {
                              if (value!.isEmpty &&
                                  !errors.contains(kphoneNumberNullError)) {
                                setState(() {
                                  errors.add(kphoneNumberNullError);
                                });
                                return '';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              phone = value!;
                            },
                            placeHolder: 'Phone',
                            inputType: TextInputType.phone,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(18),
                              child: SvgPicture.asset(
                                'assets/icons/Phone.svg',
                              ),
                            ),
                            editingController: phoneController,
                          ),
                          verticalSpacing(12.sp),
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
                              } else if (!emailValidatorRegExp
                                      .hasMatch(value) &&
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
                        ],
                      ),
                    ),
                    verticalSpacing(10.sp),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: termsAgreement,
                          onChanged: (value) {
                            setState(() {
                              if (value! &
                                  errors.contains(kTermsAgreementError)) {
                                errors.remove(kTermsAgreementError);
                              }
                              termsAgreement = !termsAgreement;
                            });
                          },
                        ),
                        Expanded(
                          child: RichText(
                            maxLines: 3,
                            text: TextSpan(
                              style: TextStyle(
                                height: 1.5.sp,
                              ),
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    FormFieldErrors(errors: errors),
                    verticalSpacing(24.sp),
                    BlocConsumer<AuthUser, AuthUserState>(
                      listener: (BuildContext context, state) {
                        if (state is UserAuthenticated) {
                          Navigator.pushNamed(context, OtpScreen.route);
                        }
                        if (state is UserAuthFailed) {
                          setState(() {
                            errors.add(kUserSignUpFailedError);
                          });
                        }
                      },
                      builder: (BuildContext context, AuthUserState? state) {
                        if (state is Idle) {
                          return SizedBox(
                            height: 50.sp,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  errors.remove(kUserSignUpFailedError);
                                  if (!termsAgreement &
                                      !errors.contains(kTermsAgreementError)) {
                                    errors.add(kTermsAgreementError);
                                  }
                                });
                                if (_formKey.currentState!.validate() &
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
                                'Sign up',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          );
                        }
                        if (state is AuthenticatingUser) {
                          return const SizedBox(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator(
                              color: primaryColor,
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                    Row(
                      children: [
                        Text(
                          'Already have account?',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: lightTextColor),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
