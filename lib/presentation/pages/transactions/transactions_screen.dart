import 'package:fets_mobile/presentation/pages/components/components.dart';
import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  static const route = 'transactions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(
          onPress: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Transactions',
          style: Theme.of(context).textTheme.headline4,
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TransactionTile(
                title: 'Suffer Master',
                subtitle: 'card payment',
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
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const Spacer(),
                Text(
                  DateFormat.yMd().format(
                    DateTime.now(),
                  ),
                ),
              ],
            ),
            Text(
              '$amount \$',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: amount > 0 ? secondaryColor : errorColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
