import 'package:fets_mobile/features/models/project.dart';
import 'package:fets_mobile/features/search_image/bloc/search_image_event.dart';
import 'package:fets_mobile/features/search_image/bloc/search_url_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    BlocProvider.of<SearchImageBloc>(context).add(
      SearchImageEvent(
        query: project.name,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Body(project: project),
    );
  }
}
