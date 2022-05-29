import 'package:hive/hive.dart';

part 'api_auth_data.g.dart';

@HiveType(typeId: 0)
class APIAuthData extends HiveObject {
  @HiveField(0)
  final String token;

  @HiveField(1)
  final int id;

  @HiveField(2)
  final String type;

  @HiveField(3)
  final String username;

  APIAuthData(
      {required this.token,
      required this.id,
      required this.type,
      required this.username});

  factory APIAuthData.fromjson(Map<String, dynamic> json) => APIAuthData(
        id: json['id'],
        token: json['token'],
        type: json['type'],
        username: json['username'],
      );
}
