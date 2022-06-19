import 'package:fets_mobile/features/fund_project/data/provider/fund_project_dp.dart';
import 'package:fets_mobile/features/models/donation.dart';

class FundProjectRepo {
  final FundProjectDP fundProjectDP;

  FundProjectRepo({required this.fundProjectDP});

  Future<void> fundProject({
    required String abiPath,
    required String functionName,
    required Donation donation,
  }) async {
    return await fundProjectDP.fundProject(
      abiPath: abiPath,
      functionName: functionName,
      args: [
        donation.donorUsername,
        donation.projectId,
        donation.amount,
        donation.donatedAt,
      ],
    );
  }
}
