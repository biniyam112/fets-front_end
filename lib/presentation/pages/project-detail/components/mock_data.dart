import 'package:fets_mobile/presentation/pages/project-detail/components/sub_project_item.dart';
import 'package:flutter/material.dart';

import 'components.dart';

class Mockdata {
  static const List<TaskItem> taskList = [
    TaskItem(
        taskTitle: "Transport construction material",
        budget: "\$ 12,042",
        dueDate: "Mar 20, 2023"),
    TaskItem(
        taskTitle: " construction material",
        budget: "\$ 12,042",
        dueDate: "Mar 20, 2023"),
    TaskItem(
        taskTitle: "Transport  material",
        budget: "\$ 12,042",
        dueDate: "Mar 20, 2023"),
  ];

  static final List subProjectList = [
    SubProjectItem(
        tasks: taskList,
        isExpanded: false,
        title: "HR placement",
        estimatedBudget: 20000,
        approvedBudget: 10000,
        estimatedDuration: "2 months ,15 days",
        status: ProjectStatus.inProgress,
        actualDuration: '3 months , 15 days',
        createdAt: DateTime.now()),
    SubProjectItem(
        tasks: taskList,
        isExpanded: false,
        title: "Construction",
        estimatedBudget: 20000,
        approvedBudget: 10000,
        estimatedDuration: "2 months ,15 days",
        status: ProjectStatus.inProgress,
        actualDuration: '3 months , 15 days',
        createdAt: DateTime.now()),
    SubProjectItem(
        tasks: taskList,
        isExpanded: false,
        title: "Water supply",
        estimatedBudget: 20000,
        approvedBudget: 10000,
        estimatedDuration: "2 months ,15 days",
        status: ProjectStatus.inProgress,
        actualDuration: '3 months , 15 days',
        createdAt: DateTime.now()),
    SubProjectItem(
        tasks: taskList,
        isExpanded: false,
        title: "HR placement",
        estimatedBudget: 20000,
        approvedBudget: 10000,
        estimatedDuration: "2 months ,15 days",
        status: ProjectStatus.inProgress,
        actualDuration: '3 months , 15 days',
        createdAt: DateTime.now()),
  ];
}
