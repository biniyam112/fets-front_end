import 'package:fets_mobile/presentation/pages/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Column(
                children: [
                  
                  const DonatedProjectCard(),
                  SizedBox(height: 7.h),
                  const FeaturedProjects(),
                  const Education()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
