import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
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

  Future<DeployedContract> getContract(String abiPath) async {
    Completer<DeployedContract> completer = Completer();
    await rootBundle.loadString(abiPath).then((abiString) {
      var abiJson = jsonDecode(abiString);
      var abi = jsonEncode(abiJson['abi']);
      EthereumAddress contractAddress =
          EthereumAddress.fromHex(abiJson['networks']['5777']['address']);
      DeployedContract contract = DeployedContract(
        ContractAbi.fromJson(abi, 'Project'),
        contractAddress,
      );
      completer.complete(contract);
    });
    completer.future.then((value) {
      for (var i = 0; i < value.functions.length; i++) {
        print(value.functions[i].name);
      }
    });
    return completer.future;
  }

  Future<List<dynamic>> readContract(
    String abiPath,
    String functionName,
    List<dynamic> args,
  ) async {
    DeployedContract contract = await getContract(abiPath);
    var queryResult = await web3client.call(
      contract: contract,
      function: contract.function(functionName),
      params: args,
    );
    return queryResult;
  }

  Future<void> writeToContract(
    String abiPath,
    String functionName,
    List<dynamic> args,
  ) async {
    try {
      DeployedContract contract = await getContract(abiPath);
      Credentials credentials = EthPrivateKey.fromHex(privateKey!);
      await web3client.sendTransaction(
          credentials,
          Transaction.callContract(
              contract: contract,
              function: contract.function(functionName),
              parameters: args));
    } catch (e) {
      throw (Exception(e));
    }
  }
}
