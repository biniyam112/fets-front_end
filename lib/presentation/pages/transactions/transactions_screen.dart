import 'package:fets_mobile/features/models/donation.dart';
import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../components/components.dart';
import 'components/body.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  static const route = 'transactions';

  @override
  Widget build(BuildContext context) {
    var donations =
        ModalRoute.of(context)!.settings.arguments as List<Donation>;
    return Scaffold(
      backgroundColor: backgroundColor,
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
      body: Body(donations: donations),
    );
  }
}
