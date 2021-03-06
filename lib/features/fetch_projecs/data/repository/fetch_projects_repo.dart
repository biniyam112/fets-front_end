import 'package:fets_mobile/features/fetch_projecs/data/provider/fetch_projects_dp.dart';
import 'package:fets_mobile/features/models/project.dart';
import 'package:web3dart/contracts.dart';

class FetchProjectsRepo {
  final FetchProjectsDP fetchProjectsDP;

  FetchProjectsRepo({required this.fetchProjectsDP});

  Future<DeployedContract> getProjectContract({required String abiPath}) async {
    return await fetchProjectsDP.getProjectContract(abiPath);
  }

  Future<List<Project>> readProjectContract({
    required String abiPath,
    required String functionName,
    required List<dynamic> args,
  }) async {
    var items = await fetchProjectsDP.readProjectContract(
      abiPath,
      functionName,
      args,
    );

    print(items[0]);
    // print(items[0]);
    //todo: this might create problem
    items = items[0];
    print('items are $items');
    return List.generate(items.length, (index) {
      return Project.fromList(items[index]);
    }).toList();
  }

  Future<void> writeToProjectContract({
    required String abiPath,
    required String functionName,
    required List<dynamic> args,
  }) async {
    return await fetchProjectsDP.writeToProjectContract(
      abiPath,
      functionName,
      args,
    );
  }
}
