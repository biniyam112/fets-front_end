import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../services/services.dart';
import 'project_filter.dart';
import 'project_list_tile.dart';
import 'quick_stat.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int filterIndex = 0;
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
                children: const [
                  ProjectListTile(
                    title: 'Food project in kototo',
                    imagePath: 'assets/images/login.jpg',
                    budget: 23423947,
                    completedSubprojects: 8,
                    completedTasks: 43,
                    totalSubprojects: 10,
                    totalTasks: 84,
                    percentage: .6,
                  ),
                  ProjectListTile(
                    title: 'Food project in kototo',
                    imagePath: 'assets/images/login.jpg',
                    budget: 4345,
                    completedSubprojects: 8,
                    completedTasks: 43,
                    totalSubprojects: 10,
                    totalTasks: 84,
                    percentage: .6,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
