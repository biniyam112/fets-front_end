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
    print(items);
    //todo: this might create problem
    return List.generate(items.length, (item) => Project.fromJson(item))
        .toList();
  }

  Future<void> writeToProjectContract({
    required String abiPath,
    required String functionName,
    required List<dynamic> args,
  }) async {
    return await fetchProjectsDP.writeToProjectContract(
        abiPath, functionName, args);
  }
}
