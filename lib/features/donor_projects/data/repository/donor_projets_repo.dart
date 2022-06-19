import 'package:fets_mobile/features/models/donation.dart';
import 'package:hive/hive.dart';

import '../../../authentication/model/model.dart';
import '../provider/donor_projects_dp.dart';

class DonorProjectsRepo {
  final DonorProjectsDP donorProjectsDP;

  DonorProjectsRepo({required this.donorProjectsDP});
  Future<List<Donation>> fetchUserDonations({
    required String userName,
    required String abiPath,
    required String functionName,
  }) async {
    var items = await donorProjectsDP.fetchUserDonations(
      args: [Hive.box<User>('users').get('user')!.userName ?? 'biniyam112'],
      abiPath: abiPath,
      functionName: functionName,
    );
    // todo: change to donation objects
    return List.generate(items.length, (index) {
      return Donation.formList(items[index]);
    }).toList();
  }
}
