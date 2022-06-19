import 'package:fets_mobile/features/models/project.dart';
import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../components/components.dart';
import 'components/body.dart';

class SendDonation extends StatelessWidget {
  const SendDonation({Key? key}) : super(key: key);

  static const route = 'send-donation';

  @override
  Widget build(BuildContext context) {
    final project = ModalRoute.of(context)!.settings.arguments as Project;
    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'Send donation',
        background: backgroundColor,
      ),
      body: Body(project: project),
    );
  }
}
