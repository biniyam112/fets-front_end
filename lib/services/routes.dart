import 'package:fets_mobile/presentation/pages/finish_signup/finish_signup.dart';
import 'package:flutter/material.dart';
import '../presentation/pages/pages.dart';

Map<String, Widget Function(BuildContext context)> route = {
  OnboardingScreen.route: (context) => const OnboardingScreen(),
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
  FinishSignup.route: (context) => const FinishSignup(),
};
