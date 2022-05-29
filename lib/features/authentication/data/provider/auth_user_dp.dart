import 'dart:convert';
import 'package:fets_mobile/features/authentication/model/api_data.dart';
import 'package:fets_mobile/features/authentication/model/signin_model.dart';
import 'package:fets_mobile/helper/url_endpoints.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import '../../authentication.dart';

class AuthUserDP {
  final Client client;

  AuthUserDP({required this.client});

  Future<User> signUp(Map<String, dynamic> json) async {
    print(json);
    try {
      var response = await client.post(
        Uri.parse(signUpUrl),
        body: jsonEncode(json),
      );
      print(response.body);
      return User.fromjson(jsonDecode(response.body));
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<APIData> signIn(SigninModel signinModel) async {
    try {
      var response = await client.post(Uri.parse(signInUrl),
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
