import 'package:fets_mobile/features/task/task.dart';
import 'package:fets_mobile/service_locator.dart';

class TaskRepository {
  final TaskDataprovider _taskDataprovider;

  TaskRepository() : _taskDataprovider = serviceLocator.get<TaskDataprovider>();
  Future<List<dynamic>> readTaskContract(
      String abiPath, String functionName, List<dynamic> args) async {
    final result =
        await _taskDataprovider.readTaskContract(abiPath, functionName, args);
    print("result....");
    print(result);
    return result;
  }
}
