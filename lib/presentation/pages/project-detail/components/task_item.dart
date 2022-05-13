import 'package:flutter/material.dart';

class TaskItem {
  final String taskTitle;
  final String dueDate;
  final String budget;

  const TaskItem(
      {Key? key,
      required this.budget,
      required this.dueDate,
      required this.taskTitle});


  // @override
  // Widget build(BuildContext context) {
  //   return Card(
  //     child: Column(
  //        crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         ListTile(
  //           title: Text(taskTitle),
  //           leading:const  Icon(Icons.check_box),
  //           subtitle: Text(dueDate),
  //         ),
  //         Text(budget)
  //       ],
  //     ),
  //   );
  // }


}
