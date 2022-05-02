import 'dart:js';

import 'package:fets_mobile/presentation/pages/forgot_password/forgot_password_screen.dart';
import 'package:fets_mobile/presentation/pages/login/login_screen.dart';
import 'package:fets_mobile/presentation/pages/otp/otp_screen.dart';
import 'package:flutter/cupertino.dart';

import '../presentation/pages/signup/signup.dart';

Map<String, Widget Function(BuildContext context)> route = {
  SignUpScreen.route: (context) => const SignUpScreen(),
  LoginScreen.route: (context) => const LoginScreen(),
  ForogtPassword.route: (context) => const ForogtPassword(),
  OtpScreen.route: (context) => const OtpScreen(),
};
