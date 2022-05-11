import 'package:fets_mobile/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../theme/theme.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpacing(10.sp),
            TransactionTile(
              title: 'School building in kototo',
              subtitle: 'card payment',
              time: DateTime.now(),
              amount: -200,
            ),
            TransactionTile(
              title: 'School building in kototo Refund',
              subtitle: 'Refund',
              time: DateTime.now(),
              amount: 200,
            ),
          ],
        ),
      ),
    );
  }
}

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
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [topShadow, bottomShadow],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontSize: 20, height: 1),
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: lightTextColor,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  verticalSpacing(8.sp),
                  Text(
                    DateFormat.yMd().format(
                      DateTime.now(),
                    ),
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: lightTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
            Text(
              '$amount \$',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: amount > 0 ? secondaryColor : errorColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
