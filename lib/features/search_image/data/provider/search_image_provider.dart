import 'dart:convert';

import 'package:fets_mobile/helper/url_endpoints.dart';
import 'package:http/http.dart' as http;

class SearchImageDP {
  final http.Client client;

  SearchImageDP({required this.client});

  Future<dynamic> searchImage({required String query}) async {
    try {
      var response = await client.get(
        Uri.parse('$unsplashUrl?query=$query&page=1'),
        headers: {
          "content-type": "application/json; charset=utf-8",
          "Authorization":
              "Client-ID bLRpcJxrnrpO1F-xqAd_dRalZniC5yebKZUDBPyOgQI"
        },
      );
      String imageUrl =
          jsonDecode(response.body)['results'][0]['urls']['regular'];
      return imageUrl;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
