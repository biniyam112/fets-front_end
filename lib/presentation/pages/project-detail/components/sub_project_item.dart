import 'components.dart';

enum ProjectStatus {
  notStarted,
  completed,
  inProgress,
}

class SubProjectItem {
  bool isExpanded;
  final List<TaskItem> tasks;
  final String title;
  final double estimatedBudget;
  final double approvedBudget;
  final String estimatedDuration;
  final String actualDuration;
  final ProjectStatus status;
  final DateTime createdAt;

  SubProjectItem(
      {required this.tasks,
      required this.isExpanded,
      required this.title,
      required this.actualDuration,
      required this.approvedBudget,
      required this.estimatedBudget,
      required this.estimatedDuration,
      required this.createdAt,
      required this.status});
}
