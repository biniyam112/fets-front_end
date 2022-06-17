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
                return SizedBox(
                  width: 1.sw,
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Center(
                      child: CircularProgressIndicator(color: primaryColor),
                    ),
                  ),
                );
              }
              if (state is ProjectsFetched) {
                List<Project> projects = state.projects;
                if (projects.isEmpty) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'No featured projects available',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ],
                  );
                }
                return Row(
                  children: [
                    ...List.generate(
                      state.projects.length,
                      ((index) {
                        Project project = projects[index];
                        return ProjectCard(
                          project: project,
                        );
                      }),
                    ),
                  ],
                );
              }
              if (state is ProjectsFetchingFailed) {
                return SizedBox(
                  width: 1.sw,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Projects feching failed\n ${state.errorMessage}',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor),
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
                  ),
                );
              }
              return const Placeholder();
            }),
          ),
        )
      ],
    );
  }
}
