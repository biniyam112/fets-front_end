import 'package:fets_mobile/features/models/project.dart';
import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../components/components.dart';
import 'components/components.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({Key? key}) : super(key: key);

  static const route = "project-detail";

  @override
  Widget build(BuildContext context) {
    final Project project =
        ModalRoute.of(context)!.settings.arguments as Project;
    print(project.companyId);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: CustomBackButton(
          onPress: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          project.name,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Body(
        project: project,
      ),
    );
  }
}
