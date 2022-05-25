import 'package:fets_mobile/presentation/pages/dashboard/dashboard.dart';
import 'package:fets_mobile/presentation/pages/search/search.dart';

import 'package:flutter/cupertino.dart';

import 'package:fets_mobile/presentation/pages/pages.dart';

import '../presentation/pages/project-detail/project_detail.dart';
import '../presentation/pages/report/report.dart';
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
  DashboardScreen.route: (context) => const DashboardScreen(),
  ProjectDetailScreen.route: (context) => const ProjectDetailScreen(),
  ReportScreen.route: (context) => const ReportScreen(),
  SearchScreen.route: (context) => const SearchScreen(),
  FeedDetailScreen.route: (context) => const FeedDetailScreen(),
  TermsAndConditions.route: (context) => const TermsAndConditions(),
  SendDonation.route: (context) => const SendDonation(),
  ProjectDetails.route: (context) => const ProjectDetails(),
};
