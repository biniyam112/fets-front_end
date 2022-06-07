import 'package:fets_mobile/features/fetch_projecs/bloc/fetch_projects_bloc.dart';
import 'package:fets_mobile/features/fetch_projecs/bloc/fetch_projects_state.dart';
import 'package:fets_mobile/presentation/pages/dashboard/components/components.dart';
import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../features/fetch_projecs/bloc/fetch_projects_event.dart';
import '../../../../features/models/project.dart';

class FeaturedProjects extends StatelessWidget {
  const FeaturedProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Featured projects',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "See all",
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w700),
                ))
          ],
        ),
        SizedBox(height: 7.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: BlocBuilder<FetchProjectsBloc, FetchProjectsState>(
            builder: ((context, state) {
              if (state is FetchingProjects) {
                return const Center(
                  child: CircularProgressIndicator(color: primaryColor),
                );
              }
              if (state is ProjectsFetched) {
                List<Project> projects = state.projects;
                return Row(
                  children: [
                    ...List.generate(
                      state.projects.length,
                      ((index) {
                        Project project = projects[index];
                        return ProjectCard(
                          name: project.name,
                          description: project.description,
                          location: project.location,
                          estimatedBudget: project.estimatedBudget,
                          fundedBudget: project.fundedMoney,
                          estimatedDuration: project.estimatedDuration,
                          createdAt: project.createdAt,
                          companyId: project.companyId,
                          accountNumber: project.accountNumber,
                          status: project.status,
                        );
                      }),
                    ),
                  ],
                );
              }
              return Column(
                children: [
                  Text(
                    'Projects feching failed',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primaryColor),
                    ),
                    onPressed: () {
                      BlocProvider.of<FetchProjectsBloc>(context)
                          .add(FetchAllProjects());
                    },
                    child: Text(
                      'Try again',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              );
            }),
          ),
        )
      ],
    );
  }
}
