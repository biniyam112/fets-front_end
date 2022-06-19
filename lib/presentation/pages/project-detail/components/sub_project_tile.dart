import 'package:expandable/expandable.dart';
import 'package:fets_mobile/features/models/models.dart';
import 'package:fets_mobile/features/task/bloc/bloc.dart';
import 'package:fets_mobile/presentation/pages/project-detail/components/components.dart';
import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubProjectTile extends StatelessWidget {
  const SubProjectTile({Key? key, required this.subprojectData})
      : super(key: key);
  final SubprojectData subprojectData;

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 5.h),
      // constraints: BoxConstraints.expand(width: 350.w, height: 180.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.w))),
      child: Column(
        children: <Widget>[
          ScrollOnExpand(
            scrollOnExpand: true,
            scrollOnCollapse: false,
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                hasIcon: false,
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToCollapse: true,
              ),
              header: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 5.w),
                    dense: true,
                    title: Text(
                      subprojectData.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    trailing: Text(
                      "Completed",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                text: "Created at",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 8.8.sp),
                              ),
                              TextSpan(
                                text:
                                    " \$${DateTime.fromMillisecondsSinceEpoch(subprojectData.createdAt.toInt())}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green,
                                    fontSize: 8.8.sp),
                              ),
                            ])),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                text: "estimated duration:",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 8.8.sp),
                              ),
                              TextSpan(
                                text: "${subprojectData.estimatedDuration}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green,
                                    fontSize: 8.8.sp),
                              ),
                            ])),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                        ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.w)),
                            child: VerticalDivider(
                              width: 20.w,
                              thickness: 3.w,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                text: "approved budget:",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                    fontSize: 8.8.sp),
                              ),
                              TextSpan(
                                text: " \$20,000",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green,
                                    fontSize: 8.8.sp),
                              ),
                            ])),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                text: "actual duration:",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                    fontSize: 8.8.sp),
                              ),
                              TextSpan(
                                text: " ${subprojectData.estimatedDuration}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.red,
                                    fontSize: 8.8.sp),
                              ),
                            ])),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          subprojectData.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Builder(builder: (context) {
                        var controller =
                            ExpandableController.of(context, required: true);
                        if (controller!.expanded) {
                          BlocProvider.of<TaskBloc>(context).add(
                              FetchTaskBySubProjectId(
                                  subProjectId: subprojectData.id));
                        }

                        return controller.expanded
                            ? const SizedBox()
                            : Icon(
                                Icons.expand_more,
                                color: Colors.grey,
                                size: 22.sp,
                              );
                      }),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  )
                ],
              ),
              collapsed: const SizedBox(),
              expanded:
                  BlocBuilder<TaskBloc, TaskState>(builder: ((context, state) {
                if (state is TaskProgressState || state is TaskInit) {
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

                if (state is TaskFailure) {
                  return SizedBox(
                    width: 1.sw,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ' Task feching failed\n ${state.errorMessage}',
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
                            BlocProvider.of<TaskBloc>(context).add(
                                FetchTaskBySubProjectId(
                                    subProjectId: subprojectData.id));
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
                List<TaskData> tasks = (state as TasksFetched).taskData;
                if (tasks.isEmpty) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'No task available',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ],
                  );
                }

                return Container(
                  margin: EdgeInsets.symmetric(vertical: 3.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                  decoration: BoxDecoration(
                      color: const Color(0xFFF6F9FE),
                      borderRadius: BorderRadius.all(Radius.circular(13.w))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Tasks",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        ...List.generate(
                          state.taskData.length,
                          ((index) {
                            TaskData task = tasks[index];
                            return TaskItemTile(
                              taskData: task,
                            );
                          }),
                        ),
                      ]),
                );
              })),
              builder: (_, collapsed, expanded) {
                return Padding(
                  padding: EdgeInsets.zero,
                  child: Expandable(
                    collapsed: collapsed,
                    expanded: expanded,
                    theme: const ExpandableThemeData(crossFadePoint: 0),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
