import 'package:fets_mobile/features/fetch_projecs/data/provider/fetch_projects_dp.dart';
import 'package:web3dart/contracts.dart';

class FetchProjectsRepo {
  final FetchProjectsDP fetchProjectsDP;

  FetchProjectsRepo({required this.fetchProjectsDP});

  Future<DeployedContract> getUserContract({required String abiPath}) async {
    return await fetchProjectsDP.getContract(abiPath);
  }

  Future<List<dynamic>> readContract({
    required String abiPath,
    required String functionName,
    required List<dynamic> args,
  }) async {
    return await fetchProjectsDP.readContract(abiPath, functionName, args);
  }

  Future<void> writeToContract({
    required String abiPath,
    required String functionName,
    required List<dynamic> args,
  }) async {
    return await fetchProjectsDP.writeToContract(abiPath, functionName, args);
  }
}
