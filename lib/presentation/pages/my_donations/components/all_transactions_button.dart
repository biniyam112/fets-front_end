import 'package:fets_mobile/features/models/donation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/theme.dart';
import '../../pages.dart';

class AllTransactionsButton extends StatelessWidget {
  const AllTransactionsButton({
    Key? key,
    required this.donations,
  }) : super(key: key);
  final List<Donation> donations;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.sp,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            TransactionsScreen.route,
            arguments: donations,
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primaryColor),
        ),
        child: Text(
          'All transactions',
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
