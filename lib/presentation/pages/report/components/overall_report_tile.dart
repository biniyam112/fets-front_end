import 'package:fets_mobile/features/task/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverallReportTile extends StatelessWidget {
  const OverallReportTile({Key? key, required this.projectBudget})
      : super(key: key);

  final double projectBudget;

  @override
  Widget build(BuildContext context) {
    final actualTaskExpense =
        BlocProvider.of<TaskBloc>(context).taskActualExpense;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
      child: Column(
        children: [
          Divider(
            thickness: 1.3.sp,
          ),
          SizedBox(
            height: 13.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "estimated expense",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
              ),
              Text(
                "\$$projectBudget",
                style: TextStyle(fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(
            height: 13.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "actual expense",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
              ),
              Text(
                "\$$actualTaskExpense",
                style: TextStyle(fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(
            height: 13.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "difference",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
              ),
              Text(
                "\$${actualTaskExpense - projectBudget}",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ],
      ),
    );
  }
}
