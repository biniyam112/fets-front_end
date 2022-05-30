import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
// import 'package:web3dart/web3dart.dart';

class SolidityContract extends StatefulWidget {
  const SolidityContract({Key? key}) : super(key: key);

  @override
  State<SolidityContract> createState() => _SolidityContractState();
}

class _SolidityContractState extends State<SolidityContract> {
  String myAdress = '0x5B38Da6a701c568545dCfcB03FcB875f56beddC4';
  String blockChainUri =
      'https://rinkeby.infura.io/v3/1535742988144dbfaf751249d3f4890c';

  late Client httpClient;
  late Web3Client ethClient;

  late int totalVotesA;
  late int totalVotesB;

  @override
  void initState() {
    httpClient = Client();
    ethClient = Web3Client(blockChainUri, httpClient);
    getTotalVotes();
    super.initState();
  }

  Future<DeployedContract> getContract() async {
    //obtain our smart contract using rootbundle to access our json file
    String abiFile = await rootBundle.loadString("assets/contract.json");
    String contractAddress = "0xee3F5a4361ec47C57394Fc028C3fBCCd0e9f1B5d";

    final contract = DeployedContract(
      ContractAbi.fromJson(abiFile, "Voting"),
      EthereumAddress.fromHex(contractAddress),
    );

    return contract;
  }

  Future<List<dynamic>> callFunction(String name) async {
    final contract = await getContract();
    final function = contract.function(name);
    final result = await ethClient
        .call(contract: contract, function: function, params: []);
    return result;
  }

  Future<void> getTotalVotes() async {
    List<dynamic> resultsA = await callFunction("getTotalVotesAlpha");
    List<dynamic> resultsB = await callFunction("getTotalVotesBeta");
    totalVotesA = resultsA[0];
    totalVotesB = resultsB[0];

    setState(() {});
  }

  Future<void> vote(bool voteAlpha) async {
    //obtain private key for write operation
    Credentials key =
        EthPrivateKey.fromHex("0x3D94399d4ACe6AeC8Ea8e51CA7168d79dab798B1");

    //obtain our contract from abi in json file
    final contract = await getContract();

    // extract function from json file
    final function = contract.function(
      voteAlpha ? "voteAlpha" : "voteBeta",
    );

    //send transaction using the our private key, function and contract
    await ethClient.sendTransaction(
        key,
        Transaction.callContract(
            contract: contract, function: function, parameters: []),
        chainId: 4);
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    //set a 20 seconds delay to allow the transaction to be verified before trying to retrieve the balance
    Future.delayed(const Duration(seconds: 20), () {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      getTotalVotes();
      ScaffoldMessenger.of(context).clearSnackBars();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
