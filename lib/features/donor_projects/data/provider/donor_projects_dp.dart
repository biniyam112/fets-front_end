import 'package:fets_mobile/helper/contrats.dart';
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';

class DonorProjectsDP {
  final http.Client client;
  final Web3Client web3client;

  DonorProjectsDP({required this.web3client, required this.client});

  Future<List<dynamic>> fetchUserDonations({
    required List args,
    required String abiPath,
    required String functionName,
  }) async {
    final result = await readContract(
      abiPath: abiPath,
      functionName: functionName,
      args: args,
      web3client: web3client,
    );
    return result[0];
  }
}
