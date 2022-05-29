import 'dart:convert';
import 'package:http/http.dart';
import '../../../../services/constants.dart';
import '../../authentication.dart';

class AuthUserDP {
  final Client client;

  AuthUserDP({required this.client});

  var url = 'http://$hostIP:5000/';

  Future<User> signUp(Map<String, dynamic> json) async {
    try {
      var response = await client.post(
        Uri.parse('$url/user/signup'),
        body: json,
      );
      return User.fromjson(jsonDecode(response.body));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
