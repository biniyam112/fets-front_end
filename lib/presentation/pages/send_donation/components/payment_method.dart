import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../services/services.dart';
import '../../../../theme/theme.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpacing(20.sp),
        Text(
          'Choose payment method',
          style: Theme.of(context).textTheme.headline5,
        ),
        verticalSpacing(10.sp),
        Row(
          children: [
            ...List.generate(
              2,
              (index) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      height: 45.sp,
                      padding: EdgeInsets.only(
                        top: 8.sp,
                        bottom: 8.sp,
                        left: 16.sp,
                        right: 10.sp,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [topShadow, bottomShadow],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.paypal,
                            color: primaryColor,
                          ),
                          horizontalSpacing(4.sp),
                          Text(
                            'pay pal',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          selectedIndex == index
                              ? Icon(
                                  CupertinoIcons.check_mark_circled,
                                  color: primaryColor,
                                  size: 22.sp,
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
