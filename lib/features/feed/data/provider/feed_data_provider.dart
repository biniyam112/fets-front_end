import 'dart:convert';

import 'package:fets_mobile/features/features.dart';
import 'package:fets_mobile/helper/url_endpoints.dart';
import 'package:fets_mobile/service_locator.dart';
import 'package:http/http.dart' as http;

class FeedDataProvider {
  final http.Client _httpClient;

  FeedDataProvider() : _httpClient = serviceLocator<http.Client>();

  Future<APIData> getAllFeeds() async {
    try {
      final response = await _httpClient.get(Uri.parse(feedUrl));
      // print(response.body["statusCode"])
      return APIData.fromJson(jsonDecode(response.body));
    } catch (e) {
      return APIData(
          error: true, statusCode: 500, success: false, errors: [e.toString()]);
    }
  }
}
