import 'package:fets_mobile/features/models/project.dart';
import 'package:fets_mobile/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'components/body.dart';

class ProjectDetails extends StatefulWidget {
  const ProjectDetails({Key? key}) : super(key: key);

  static const route = 'project-details';

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> {
  @override
  Widget build(BuildContext context) {
    final project = ModalRoute.of(context)!.settings.arguments as Project;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(project: project),
    );
  }
}
