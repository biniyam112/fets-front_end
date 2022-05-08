


import 'package:fets_mobile/presentation/pages/dashboard/dashboard.dart';
import 'package:flutter/cupertino.dart';

import '../presentation/pages/signup/signup.dart';

Map<String, Widget Function(BuildContext context)> route = {
  SignUpScreen.route: (context) => const SignUpScreen(),
  DashboardScreen.route: (context) => const DashboardScreen()
};
