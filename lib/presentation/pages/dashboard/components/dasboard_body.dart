import 'package:fets_mobile/features/fetch_projecs/bloc/fetch_projects_state.dart';
import 'package:fets_mobile/presentation/pages/dashboard/dashboard.dart';
import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../../../features/authentication/model/model.dart';
import '../../../../features/fetch_projecs/bloc/fetch_projects_bloc.dart';
import '../../../../features/fetch_projecs/bloc/fetch_projects_event.dart';

class DashboardBody extends StatefulWidget {
  const DashboardBody({Key? key}) : super(key: key);

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  @override
  void initState() {
    BlocProvider.of<FetchProjectsBloc>(context).add(FetchAllProjects());
    BlocProvider.of<FetchDonorProjectsBloc>(context).add(
      FetchDonorProjects(
        userName: Hive.box<User>('users').get('user')!.userName ?? 'biniyam112',
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 3.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DashboardAppBar(),
          BlocBuilder<FetchDonorProjectsBloc, FetchProjectsState>(
            builder: (context, state) {
              return Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<FetchDonorProjectsBloc>(context).add(
                      FetchDonorProjects(
                        userName:
                            Hive.box<User>('users').get('user')!.userName ??
                                'biniyam112',
                      ),
                    );
                    BlocProvider.of<FetchProjectsBloc>(context)
                        .add(FetchAllProjects());
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics()),
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Column(
                      children: [
                        (state is ProjectsFetched)
                            ? DonatedProjectCard(projects: state.projects)
                            : const DonatedProjectCard(projects: []),
                        SizedBox(height: 7.h),
                        const FeaturedProjects(),
                        // const Education()
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
