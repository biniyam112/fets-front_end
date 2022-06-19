import 'package:fets_mobile/features/models/models.dart';
import 'package:fets_mobile/features/task/task.dart';
import 'package:fets_mobile/helper/helper.dart';
import 'package:fets_mobile/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository _taskRepository;

  double taskActualExpense = 0;

  TaskBloc()
      : _taskRepository = serviceLocator.get<TaskRepository>(),
        super(TaskInit()) {
    on<FetchTaskBySubProjectId>(_fetchTaskBySubProjectId);
    on<FetchTaskByProjectId>(_fetchTaskByProjectId);
  }

  Future<void> _fetchTaskBySubProjectId(
      FetchTaskBySubProjectId event, Emitter<TaskState> emit) async {
    print("object");
    emit(TaskProgressState());
    try {
      final contractData = await _taskRepository.readTaskContract(
          "assets/abis/Task.json",
          "getTasksListFromSubProjectId",
          [event.subProjectId]);

      final taskData = List.generate(contractData[0].length, (index) {
        return TaskData.fromList(contractData[0][index]);
      }).toList();

      emit(TasksFetched(taskData: taskData));
    } catch (e) {
      emit(TaskFailure(errorMessage: e.toString()));
    }
  }

  Future<void> _fetchTaskByProjectId(
      FetchTaskByProjectId event, Emitter<TaskState> emit) async {
    // print("object");

    TaskReportHelper taskReportHelper = TaskReportHelper();
    emit(TaskProgressState());
    try {
      final contractData = await _taskRepository.readTaskContract(
          "assets/abis/Task.json",
          "getTasksListFromProjectId",
          [event.projectId]);

      final taskData = List.generate(contractData[0].length, (index) {
        return TaskData.fromList(contractData[0][index]);
      }).toList();

      print(taskData[0]);
      final actualExpense = taskReportHelper.calcActualTaskExpense(taskData);

      taskActualExpense = actualExpense;
      print("actual expense $taskActualExpense");

      // emit(TasksActualExpenseCalc(actualBudget: actualExpense));
    } catch (e) {
      emit(TaskFailure(errorMessage: e.toString()));
    }
  }
}
