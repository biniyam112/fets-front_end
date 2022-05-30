import 'dart:convert';
import 'package:fets_mobile/helper/url_endpoints.dart';
import 'package:http/http.dart';
import '../../authentication.dart';

class AuthUserDP {
  final Client client;

  AuthUserDP({required this.client});

  Future<String> signUp(Map<String, dynamic> json) async {
    try {
      var response = await client
          .post(
            Uri.parse(signUpUrl),
            headers: {
              "content-type": "application/json; charset=utf-8",
            },
            body: jsonEncode(json),
          )
          .timeout(const Duration(
            seconds: 20,
          ));

      return response.body;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<APIData> signIn(SigninModel signinModel) async {
    try {
      var response = await client.post(Uri.parse(signInUrl),
          headers: {
            "content-type": "application/json; charset=utf-8",
          },
          body: jsonEncode(
            signinModel.tojson(),
          ));
      return APIData.fromJson(jsonDecode(response.body));
    } catch (e) {
      return APIData(
          error: true, statusCode: 500, success: false, errors: [e.toString()]);
    }
  }
}
