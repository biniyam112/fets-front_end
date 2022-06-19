import 'package:fets_mobile/features/sub-project/data/data.dart';
import 'package:fets_mobile/service_locator.dart';

class SubProjectRepository {
  final SubProjectDataprovider _subProjectDataprovider;

  SubProjectRepository()
      : _subProjectDataprovider = serviceLocator.get<SubProjectDataprovider>();

  Future<List<dynamic>> readSuprojectContract(
      String abiPath, String functionName, List<dynamic> args) async {
    final result = await _subProjectDataprovider.readSubProjectContract(
        abiPath, functionName, args);

    return result;
  }
}
