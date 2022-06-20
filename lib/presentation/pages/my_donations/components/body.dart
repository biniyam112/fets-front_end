import 'package:fets_mobile/features/donor_projects/bloc/donor_projects_bloc.dart';
import 'package:fets_mobile/features/models/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../../../features/authentication/model/model.dart';
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
      FetchUserDonations(
        userName: Hive.box<User>('users').get('user')!.userName ?? 'biniyam112',
      ),
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
              (widget.projects[0].id.toInt() == 0)
                  ? SizedBox(
                      height: .2.sh,
                      width: 1.sw,
                      child: Center(
                        child: Text(
                          'No funded projects available',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    )
                  : Column(
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
