

import 'package:fets_mobile/presentation/pages/dashboard/dashboard.dart';


import 'package:flutter/cupertino.dart';

import 'package:fets_mobile/presentation/pages/pages.dart';

import '../presentation/pages/project-detail/project_detail.dart';

Map<String, Widget Function(BuildContext context)> route = {
  SignUpScreen.route: (context) => const SignUpScreen(),
  LoginScreen.route: (context) => const LoginScreen(),
  ForogtPassword.route: (context) => const ForogtPassword(),
  OtpScreen.route: (context) => const OtpScreen(),
  ResetPassword.route: (context) => const ResetPassword(),
  TransactionsScreen.route: (context) => const TransactionsScreen(),
  MyDonationsScreen.route: (context) => const MyDonationsScreen(),
  DashboardScreen.route: (context) => const DashboardScreen(),
  ProjectDetailScreen.route: (context) => const ProjectDetailScreen()
};
