import 'package:fets_mobile/features/donor_projects/bloc/donor_projects_bloc.dart';
import 'package:fets_mobile/features/models/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../features/donor_projects/bloc/donor_projects_event.dart';
import '../../../../services/services.dart';
import 'project_filter.dart';
import 'project_list_tile.dart';
import 'quick_stat.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.projects}) : super(key: key);
  final List<Project> projects;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int filterIndex = 0;

  @override
  void initState() {
    BlocProvider.of<DonorProjectBloc>(context).add(
      FetchUserDonations(userName: 'biniyam112'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const DonorStatCard(),
              verticalSpacing(10.sp),
              ProjectsFilter(
                filters: const [
                  'All projects',
                  'Completed',
                  'Inprogress',
                ],
                selectedIndex: filterIndex,
                onChanged: (index) {
                  setState(() {
                    filterIndex = index;
                  });
                },
              ),
              Column(
                children: [
                  ...List.generate(widget.projects.length, (index) {
                    Project project = widget.projects[index];
                    return ProjectListTile(
                      project: project,
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
