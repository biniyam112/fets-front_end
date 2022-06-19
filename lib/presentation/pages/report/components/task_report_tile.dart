import 'package:expandable/expandable.dart';
import 'package:fets_mobile/features/models/models.dart';
import 'package:fets_mobile/features/task/bloc/bloc.dart';
import 'package:fets_mobile/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskReportTile extends StatelessWidget {
  const TaskReportTile({Key? key, required this.subprojectData})
      : super(key: key);

  final SubprojectData subprojectData;
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        padding: EdgeInsets.zero,
        child: Column(
          children: <Widget>[
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                header: Text(subprojectData.name,
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 13.sp)),
                collapsed: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subprojectData.description,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Color(0xFF129113)),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Divider(
                      height: 0.sp,
                      thickness: 1.3.sp,
                    )
                  ],
                ),
                expanded: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 8.h),
                        child: BlocBuilder<TaskBloc, TaskState>(
                          builder: ((context, state) {
                            if (state is TaskInit ||
                                state is TaskProgressState) {
                              return SizedBox(
                                width: 1.sw,
                                child: const Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                        color: primaryColor),
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
                                          .copyWith(
                                              fontWeight: FontWeight.w600),
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                primaryColor),
                                      ),
                                      onPressed: () {
                                        BlocProvider.of<TaskBloc>(context).add(
                                            FetchTaskBySubProjectId(
                                                subProjectId:
                                                    subprojectData.id));
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

                            List<TaskData> tasks =
                                (state as TasksFetched).taskData;
                            if (tasks.isEmpty) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'No task available',
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                    ),
                                  ),
                                ],
                              );
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Task name",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12.sp),
                                    ),
                                    Text(
                                      "duration",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12.sp),
                                    ),
                                    Text(
                                      "task budget",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp),
                                    ),
                                  ],
                                ),
                                ...List.generate(
                                  state.taskData.length,
                                  ((index) {
                                    TaskData task = tasks[index];
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          task.name,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "${DateTime.fromMillisecondsSinceEpoch(task.estimatedDuration.toInt()).day}",
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          "\$${task.allocatedBudget}",
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                ),
                              ],
                            );
                          }),
                        )),
                    SizedBox(
                      height: 7.h,
                    ),
                    Text(
                      subprojectData.description,
                      style: const TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Divider(
                      height: 0.sp,
                      thickness: 1.3.sp,
                    ),
                  ],
                ),
                builder: (context, collapsed, expanded) {
                  var controller =
                      ExpandableController.of(context, required: true);
                  if (controller!.expanded) {
                    BlocProvider.of<TaskBloc>(context).add(
                        FetchTaskBySubProjectId(
                            subProjectId: subprojectData.id));
                  }
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
      ),
    ));
  }
}
