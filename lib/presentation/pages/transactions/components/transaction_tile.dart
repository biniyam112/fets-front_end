import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../services/services.dart';
import '../../../../theme/theme.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.amount,
  }) : super(key: key);
  final String title, subtitle;
  final DateTime time;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.sp),
        boxShadow: const [topShadow, bottomShadow],
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontSize: 17,
                          height: 1.2,
                        ),
                  ),
                  verticalSpacing(2.sp),
                  Text(
                    '#$subtitle',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: lightTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                  ),
                  verticalSpacing(8.sp),
                  Text(
                    DateFormat.yMMMd().format(
                      DateTime.now(),
                    ),
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: lightTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                  ),
                ],
              ),
            ),
            horizontalSpacing(20.sp),
            Text(
              '$amount \$',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: amount > 0 ? secondaryColor : errorColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    fontSize: 16,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
