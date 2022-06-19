import 'package:fets_mobile/helper/helper.dart';
import 'package:fets_mobile/service_locator.dart';
import 'package:web3dart/web3dart.dart';

class SubProjectDataprovider {
  final Web3Client _web3client;

  SubProjectDataprovider() : _web3client = serviceLocator.get<Web3Client>();

  Future<List<dynamic>> readSubProjectContract(
      String abiPath, String functionName, List<dynamic> args) async {
    final result = await readContract(
        abiPath: abiPath,
        functionName: functionName,
        args: args,
        web3client: _web3client);
    // print(result);
    return result;
  }
}
