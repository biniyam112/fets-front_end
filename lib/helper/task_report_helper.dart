import 'package:fets_mobile/features/models/task_data.dart';

class TaskReportHelper {
  double actualExpense = 0;

  double calcActualTaskExpense(List<TaskData> taskList) {
    for (int i = 0; i < taskList.length; i++) {
      actualExpense += taskList[i].allocatedBudget.toDouble();
    }

    return actualExpense;
  }

  double calcDifference(double estimatedExpense, double actualExpense) {
    return actualExpense - estimatedExpense;
  }
}
