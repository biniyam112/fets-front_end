import 'dart:js';

import 'package:fets_mobile/screens/signup/signup.dart';
import 'package:flutter/cupertino.dart';

Map<String, Widget Function(BuildContext context)> route = {
  SignUpScreen.route: (context) => const SignUpScreen(),
};
