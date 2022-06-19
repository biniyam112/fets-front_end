import 'package:equatable/equatable.dart';
import 'package:fets_mobile/features/models/models.dart';

abstract class TaskState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TaskInit extends TaskState {}

class TaskProgressState extends TaskState {}

class TasksFetched extends TaskState {
  final List<TaskData> taskData;

  TasksFetched({required this.taskData});

  @override
  List<Object?> get props => [taskData];
}

class TasksActualExpenseCalc extends TaskState {
  final double actualBudget;

  TasksActualExpenseCalc({required this.actualBudget});

  @override
  List<Object?> get props => [actualBudget];
}

class TaskFailure extends TaskState {
  final String errorMessage;

  TaskFailure({required this.errorMessage});

  @override
  List<Object?> get props => [this.errorMessage];
}
