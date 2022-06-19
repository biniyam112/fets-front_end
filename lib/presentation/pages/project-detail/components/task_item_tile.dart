import 'package:fets_mobile/features/models/task_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskItemTile extends StatelessWidget {
  final TaskData taskData;
  const TaskItemTile({Key? key, required this.taskData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.zero,
      margin: EdgeInsets.symmetric(vertical: 3.h),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.all(Radius.circular(10.w))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.translate(
            offset: Offset(0, -5.sp),
            child: ListTile(
              dense: true,
              title: Transform.translate(
                  offset: Offset(-16.sp, 0),
                  child: Text(
                    taskData.name,
                    style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600),
                  )),
              subtitle: Transform.translate(
                  offset: Offset(-16.sp, 0),
                  child: Text(
                    "${taskData.createdAt}",
                    style: TextStyle(fontSize: 10.sp),
                  )),
              leading: const Icon(Icons.check_box_outlined),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.w),
            child: Transform.translate(
              offset: Offset(0, -10.sp),
              child: Text(
                "\$ ${taskData.allocatedBudget}",
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.sp),
              ),
            ),
          )
        ],
      ),
    );
  }
}
