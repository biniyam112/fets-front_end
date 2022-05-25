import 'package:flutter/rendering.dart';

import 'theme.dart';

const topShadow = BoxShadow(
  color: shadowColor,
  offset: Offset(3, 3),
  blurRadius: 3,
  spreadRadius: .1,
);

const bottomShadow = BoxShadow(
  color: shadowColor,
  offset: Offset(-2, -2),
  blurRadius: 2,
  spreadRadius: .1,
);
