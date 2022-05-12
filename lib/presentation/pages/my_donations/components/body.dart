import 'package:fets_mobile/presentation/pages/pages.dart';
import 'package:fets_mobile/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/theme.dart';
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
              Column(
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...List.generate(3, (index) {
            const List<String> category = [
              'All projects',
              'Completed',
              'Inprogress',
            ];
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap: () => onChanged(index),
                child: Container(
                  height: 40.sp,
                  margin: EdgeInsets.symmetric(vertical: 6.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: selectedIndex == index
                        ? primaryColor
                        : Colors.transparent,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        category[index],
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : lightTextColor,
                              fontSize: 14,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
