import 'package:fets_mobile/features/features.dart';

import 'package:fets_mobile/service_locator.dart';

class FeedRepository {
  final FeedDataProvider _feedDataProvider;

  FeedRepository() : _feedDataProvider = serviceLocator<FeedDataProvider>();

  Future<APIData> getAllFeeds() async {
    final apiData = await _feedDataProvider.getAllFeeds();

    return apiData;
  }
}
