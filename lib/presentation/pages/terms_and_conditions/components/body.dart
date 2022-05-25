import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool loaded = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: Stack(
        children: [
          WebView(
            onPageFinished: (uri) => setState(() {
              loaded = true;
            }),
            initialUrl: 'https://pub.dev/packages/webview_flutter',
          ),
          loaded
              ? SizedBox(
                  height: 20.sp,
                  width: 20.sp,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  ),
                )
              : Stack()
        ],
      ),
    );
  }
}
