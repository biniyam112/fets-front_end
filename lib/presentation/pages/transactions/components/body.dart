import 'package:fets_mobile/features/models/donation.dart';
import 'package:fets_mobile/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'transaction_tile.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.donations,
  }) : super(key: key);
  final List<Donation> donations;

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
              ...List.generate(
                donations.length,
                (index) {
                  Donation donation = donations[index];
                  var datetime = DateTime.fromMillisecondsSinceEpoch(
                      donation.donatedAt.toInt());

                  return TransactionTile(
                    title: donation.projectId.toString(),
                    subtitle: 'Card Payment',
                    time: datetime,
                    amount: donation.amount.toDouble(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
