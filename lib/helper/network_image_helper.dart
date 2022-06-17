import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NetworkImageHelper {
  static Widget getNetworkFadeImage(String imageUrl) {
    return FadeInImage(
        imageErrorBuilder: (context, error, stacktrace) {
          return Image.asset(
            "assets/images/placeholder_image.png",
            height: 150.h,
            width: 300.w,
            fit: BoxFit.cover,
          );
        },
        height: 150.h,
        width: 300.w,
        fit: BoxFit.cover,
        placeholder: const AssetImage(
          "assets/images/placeholder_image.png",
        ),
        image: NetworkImage(imageUrl));
  }
}
