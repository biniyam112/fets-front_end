import 'package:fets_mobile/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  'Choose payment method',
                  style: Theme.of(context).textTheme.headline5,
                ),
                verticalSpacing(10.sp),
                Row(
                  children: [
                    Container(),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
