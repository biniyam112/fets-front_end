import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:web3dart/web3dart.dart';

import '../../../../helper/helper.dart';

class FundProjectDP {
  final http.Client client;
  final Web3Client web3client;

  FundProjectDP({required this.web3client, required this.client});

  final String? privateKey = dotenv.get('ethereum_privateKey');

  Future<void> fundProject({
    required String abiPath,
    required String functionName,
    required List args,
  }) async {
    print('the private key is $privateKey');
    return await writeToContract(
      web3client: web3client,
      abiPath: abiPath,
      privateKey: privateKey!,
      functionName: functionName,
      args: args,
    );
  }
}
