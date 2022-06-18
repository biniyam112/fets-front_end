import 'package:fets_mobile/helper/contrats.dart';
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';

class FetchProjectsDP {
  final http.Client client;
  final Web3Client web3client;
  FetchProjectsDP({
    required this.client,
    required this.web3client,
  });

  final String? privateKey = const String.fromEnvironment('ganache_privateKey');

  Future<void> writeToProjectContract(
      String abiPath, String functionName, List args) async {
    return await writeToContract(
      abiPath: abiPath,
      privateKey: privateKey!,
      functionName: functionName,
      args: args,
      web3client: web3client,
    );
  }

  Future<List<dynamic>> readProjectContract(
      String abiPath, String functionName, List args) async {
    final result = await readContract(
      abiPath: abiPath,
      functionName: functionName,
      args: args,
      web3client: web3client,
    );

    return result;  }

  Future<DeployedContract> getProjectContract(String abiPath) async {
    return await getContract(abiPath: abiPath);
  }
}
