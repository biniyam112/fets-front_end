import 'package:fets_mobile/features/search_image/data/provider/search_image_provider.dart';

class SearchImageRepo {
  final SearchImageDP searchImageDP;

  SearchImageRepo({required this.searchImageDP});

  Future<String> searchImage({required String query}) async {
    return await searchImageDP.searchImage(query: query);
  }
}
