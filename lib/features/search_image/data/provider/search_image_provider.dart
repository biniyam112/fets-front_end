import 'dart:convert';

import 'package:fets_mobile/helper/url_endpoints.dart';
import 'package:http/http.dart' as http;

class SearchImageDP {
  final http.Client client;

  SearchImageDP({required this.client});

  Future<List<dynamic>> searchImage({required String query}) async {
    try {
      var response = await client.get(
        Uri.parse('$unsplashUrl?query=$query&page=1'),
      );
      List<dynamic> body = jsonDecode(response.body)['results'];
      return body;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
