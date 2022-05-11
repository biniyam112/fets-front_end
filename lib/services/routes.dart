import 'package:flutter/material.dart';
import '../presentation/pages/pages.dart';

Map<String, Widget Function(BuildContext context)> route = {
  SignUpScreen.route: (context) => const SignUpScreen(),
  LoginScreen.route: (context) => const LoginScreen(),
  ForogtPassword.route: (context) => const ForogtPassword(),
  OtpScreen.route: (context) => const OtpScreen(),
  ResetPassword.route: (context) => const ResetPassword(),
  TransactionsScreen.route: (context) => const TransactionsScreen(),
  MyDonationsScreen.route: (context) => const MyDonationsScreen(),
  TermsAndConditions.route: (context) => const TermsAndConditions(),
  SendDonation.route: (context) => const SendDonation(),
  ProjectDetails.route: (context) => const ProjectDetails(),
};
