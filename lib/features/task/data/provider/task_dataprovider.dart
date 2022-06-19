import 'package:fets_mobile/helper/helper.dart';
import 'package:fets_mobile/service_locator.dart';
import 'package:web3dart/web3dart.dart';

class TaskDataprovider {
  final Web3Client _web3client;

  TaskDataprovider() : _web3client = serviceLocator.get<Web3Client>();

  Future<List<dynamic>> readTaskContract(
      String abiPath, String functionName, List<dynamic> args) async {
    return readContract(
        abiPath: abiPath,
        functionName: functionName,
        args: args,
        web3client: _web3client);
  }
}
