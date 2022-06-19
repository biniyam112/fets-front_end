import 'package:fets_mobile/features/models/models.dart';
import 'package:fets_mobile/features/task/bloc/bloc.dart';
import 'package:fets_mobile/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components.dart';

class Body extends StatelessWidget {
  const Body(
      {Key? key, required this.subProjectList, required this.projectBudget})
      : super(key: key);
  final List<SubprojectData> subProjectList;
  final BigInt projectBudget;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReportList(
          subProjectList: subProjectList,
        ),
        OverallReportTile(
          projectBudget: projectBudget.toDouble(),
        )
      ],
    );
    // return BlocBuilder<TaskBloc, TaskState>(builder: ((context, state) {
    //   if (state is TaskInit || state is TaskProgressState) {
    //     return SizedBox(
    //       width: 1.sw,
    //       child: const Padding(
    //         padding: EdgeInsets.all(12),
    //         child: Center(
    //           child: CircularProgressIndicator(color: primaryColor),
    //         ),
    //       ),
    //     );
    //   }
    //   if (state is TaskFailure) {
    //     return SizedBox(
    //       width: 1.sw,
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Text(
    //             ' Task feching failed\n ${state.errorMessage}',
    //             style: Theme.of(context)
    //                 .textTheme
    //                 .headline4!
    //                 .copyWith(fontWeight: FontWeight.w600),
    //           ),
    //           ElevatedButton(
    //             style: ButtonStyle(
    //               backgroundColor: MaterialStateProperty.all(primaryColor),
    //             ),
    //             onPressed: () {
    //               BlocProvider.of<TaskBloc>(context).add(FetchTaskByProjectId(
    //                   projectId: subProjectList[0].projectId));
    //             },
    //             child: Text(
    //               'Try again',
    //               style: Theme.of(context)
    //                   .textTheme
    //                   .headline5!
    //                   .copyWith(color: Colors.white),
    //             ),
    //           ),
    //         ],
    //       ),
    //     );
    //   }

    // }));
  }
}
