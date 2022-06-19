import 'package:fets_mobile/features/models/models.dart';
import 'package:fets_mobile/features/sub-project/sub_project.dart';
import 'package:fets_mobile/features/task/bloc/bloc.dart';
import 'package:fets_mobile/presentation/pages/project-detail/components/components.dart';
import 'package:fets_mobile/presentation/pages/report/report.dart';
import 'package:fets_mobile/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubProjects extends StatelessWidget {
  final Project project;
  const SubProjects({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool subprojectFetched = false;
    return RefreshIndicator(
      onRefresh: () async => {
        BlocProvider.of<SubprojectBloc>(context)
            .add(FetchSubprojectByProjectId(projectId: project.id))
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "subprojects",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
            ),
            SizedBox(
              height: 10.h,
            ),
            BlocConsumer<SubprojectBloc, SubprojectState>(
              listener: (context, state) => {
                if (state is SubProjectsFetched &&
                    state.subprojectData.isNotEmpty)
                  {subprojectFetched = true}
              },
              builder: ((context, state) {
                if (state is SubprojectProgressState ||
                    state is SubprojectInit) {
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

                if (state is SubprojectFailure) {
                  return SizedBox(
                    width: 1.sw,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'subproject feching failed\n ${state.errorMessage}',
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
                            BlocProvider.of<SubprojectBloc>(context).add(
                                FetchSubprojectByProjectId(
                                    projectId: project.id));
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

                List<SubprojectData> subproject =
                    (state as SubProjectsFetched).subprojectData;
                if (subproject.isEmpty) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'No sub-projects available',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ],
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ...List.generate(
                      state.subprojectData.length,
                      ((index) {
                        SubprojectData subprojectData = subproject[index];
                        return SubProjectTile(
                          subprojectData: subprojectData,
                        );
                      }),
                    ),
                    ElevatedButton(
                        onPressed: subprojectFetched
                            ? () {
                                BlocProvider.of<TaskBloc>(context).add(
                                    FetchTaskByProjectId(
                                        projectId: project.id));

                                Navigator.pushNamed(context, ReportScreen.route,
                                    arguments: [
                                      state.subprojectData,
                                      project.estimatedBudget
                                    ]);
                              }
                            : () {},
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 12.h)),
                        child: Text(
                          "Generate Project",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14.sp),
                        )),
                  ],
                );
              }),
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}
