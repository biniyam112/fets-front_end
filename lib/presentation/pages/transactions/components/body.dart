import 'package:fets_mobile/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'transaction_tile.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                title: 'School building in uga Refund',
                subtitle: 'Refund',
                time: DateTime.now(),
                amount: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
