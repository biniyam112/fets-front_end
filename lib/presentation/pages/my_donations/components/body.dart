import 'package:fets_mobile/presentation/pages/pages.dart';
import 'package:fets_mobile/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/theme.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const DonorStatCard(),
              verticalSpacing(20.sp),
              ProjectsFilter(
                selectedIndex: filterIndex,
                onChanged: (index) {
                  setState(() {
                    filterIndex = index;
                  });
                },
              ),
              verticalSpacing(10.sp),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: const [
                    ProjectListTile(
                      title: 'Food project in kototo',
                      imagePath: 'assets/images/login.jpg',
                      budget: '',
                      completedSubprojects: 8,
                      completedTasks: 43,
                      totalSubprojects: 10,
                      totalTasks: 84,
                      percentage: .6,
                    ),
                    ProjectListTile(
                      title: 'Food project in kototo',
                      imagePath: 'assets/images/login.jpg',
                      budget: '',
                      completedSubprojects: 8,
                      completedTasks: 43,
                      totalSubprojects: 10,
                      totalTasks: 84,
                      percentage: .6,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectListTile extends StatelessWidget {
  const ProjectListTile({
    Key? key,
    required this.title,
    required this.budget,
    required this.completedSubprojects,
    required this.completedTasks,
    required this.imagePath,
    required this.percentage,
    required this.totalSubprojects,
    required this.totalTasks,
  }) : super(key: key);
  final String title, budget, imagePath;
  final int completedSubprojects, completedTasks, totalSubprojects, totalTasks;
  final double percentage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        ProjectDetails.route,
      ),
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [topShadow, bottomShadow],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: const [topShadow, bottomShadow],
                    ),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                horizontalSpacing(12.sp),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      verticalSpacing(10),
                      Row(
                        children: [
                          Text(
                            '$budget \$',
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      // fontSize: 18,
                                    ),
                          ),
                          horizontalSpacing(6.sp),
                          Text(
                            'budget',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: lightTextColor),
                          ),
                        ],
                      ),
                      Text(
                        '$completedSubprojects of 8 subprojects completed',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: lightTextColor),
                      ),
                      Text(
                        '$completedTasks of 8 tasks completed',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: lightTextColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpacing(8.sp),
            Row(
              children: [
                Expanded(
                  child: Opacity(
                    opacity: 1.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${percentage * 100}',
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        const Icon(
                          Icons.percent_rounded,
                          color: primaryColor,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                horizontalSpacing(10.sp),
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      backgroundColor: shadowColor,
                      color: primaryColor,
                      value: .6,
                      minHeight: 8.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectsFilter extends StatelessWidget {
  const ProjectsFilter({
    Key? key,
    required this.selectedIndex,
    required this.onChanged,
  }) : super(key: key);
  final int selectedIndex;
  final void Function(int index) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          topShadow,
          bottomShadow,
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () => onChanged(0),
            child: Container(
              height: 50.sp,
              margin: EdgeInsets.symmetric(vertical: 12.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: selectedIndex == 0 ? primaryColor : Colors.transparent,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'All Projets',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: selectedIndex == 0
                              ? Colors.white
                              : lightTextColor,
                          fontSize: 14,
                        ),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => onChanged(1),
            child: Container(
              height: 50.sp,
              margin: EdgeInsets.symmetric(vertical: 12.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: selectedIndex == 1 ? primaryColor : Colors.transparent,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'In progress',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: selectedIndex == 1
                              ? Colors.white
                              : lightTextColor,
                          fontSize: 14,
                        ),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => onChanged(2),
            child: Container(
              height: 50.sp,
              margin: EdgeInsets.symmetric(vertical: 12.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: selectedIndex == 2 ? primaryColor : Colors.transparent,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'Completed',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: selectedIndex == 2
                              ? Colors.white
                              : lightTextColor,
                          fontSize: 14,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DonorStatCard extends StatelessWidget {
  const DonorStatCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          topShadow,
          bottomShadow,
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const QuickStatus(
                  donorName: 'US Aid',
                  donorId: '48147648g48231t468er6234',
                  donatedProjects: 10,
                  completedProjects: 4,
                  inprogressProjects: 3,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'total donations',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 14,
                            color: lightTextColor,
                          ),
                    ),
                    Text(
                      '${2234234.45} \$',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.1,
                            fontSize: 20,
                          ),
                    ),
                    verticalSpacing(16.sp),
                    Text(
                      'maximum donation',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 14,
                            color: lightTextColor,
                          ),
                    ),
                    Text(
                      '${134234} \$',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.1,
                            fontSize: 20,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 50.sp,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, TransactionsScreen.route);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor),
                ),
                child: Text(
                  'All transactions',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuickStatus extends StatelessWidget {
  const QuickStatus({
    Key? key,
    required this.donorName,
    required this.donorId,
    required this.donatedProjects,
    required this.completedProjects,
    required this.inprogressProjects,
  }) : super(key: key);
  final String donorName, donorId;
  final int donatedProjects, completedProjects, inprogressProjects;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Arab AID',
          style: Theme.of(context).textTheme.headline3,
        ),
        Text(
          'transaction id',
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontSize: 14,
                color: lightTextColor,
              ),
        ),
        verticalSpacing(16.sp),
        Text(
          'Status',
          style: Theme.of(context).textTheme.headline4,
        ),
        verticalSpacing(10.sp),
        const TitleAndCount(
          title: 'Donated Projects',
          count: 3,
        ),
        const TitleAndCount(
          title: 'completed Projects',
          count: 3,
        ),
        const TitleAndCount(
          title: 'Projects in progress',
          count: 3,
        ),
        verticalSpacing(20.sp),
      ],
    );
  }
}

class TitleAndCount extends StatelessWidget {
  const TitleAndCount({
    Key? key,
    required this.title,
    required this.count,
  }) : super(key: key);
  final String title;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.sp),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 14,
                  color: lightTextColor,
                ),
          ),
          horizontalSpacing(12),
          Text(
            '$count',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
