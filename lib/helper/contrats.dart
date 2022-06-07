import 'dart:convert';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';

Future<DeployedContract> getContract({required String abiPath}) async {
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
  // completer.future.then((value) {
  //   for (var i = 0; i < value.functions.length; i++) {
  //     print(value.functions[i].name);
  //   }
  // });
  return completer.future;
}

Future<List<dynamic>> readContract({
  required String abiPath,
  required String functionName,
  required List<dynamic> args,
  required Web3Client web3client,
}) async {
  DeployedContract contract = await getContract(abiPath: abiPath);
  var queryResult = await web3client.call(
    contract: contract,
    function: contract.function(functionName),
    params: args,
  );
  return queryResult;
}

Future<void> writeToContract({
  required String abiPath,
  required String privateKey,
  required String functionName,
  required List<dynamic> args,
  required Web3Client web3client,
}) async {
  try {
    DeployedContract contract = await getContract(abiPath: abiPath);
    Credentials credentials = EthPrivateKey.fromHex(privateKey);
    await web3client.sendTransaction(
        credentials,
        Transaction.callContract(
          contract: contract,
          function: contract.function(functionName),
          parameters: args,
        ));
  } catch (e) {
    throw (Exception(e));
  }
}
