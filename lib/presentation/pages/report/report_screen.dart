import 'package:fets_mobile/features/models/models.dart';
import 'package:fets_mobile/features/task/bloc/bloc.dart';
import 'package:fets_mobile/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/components.dart';
import 'components/body.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  static const route = "report";

  @override
  Widget build(BuildContext context) {
    final List<dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as List;

    final List<SubprojectData> subprojectList = arguments[0];
    final BigInt projectEstimatedBudget = arguments[1] as BigInt;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: CustomBackButton(
          onPress: () {
            //  BlocProvider.of<TaskBloc>(context).add(
            //                         Fetch(
            //                             subProjectId: project.id));

            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          'Report',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Body(
          subProjectList: subprojectList,
          projectBudget: projectEstimatedBudget),
    );
  }
}
