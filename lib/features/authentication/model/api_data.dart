import 'package:json_annotation/json_annotation.dart';

part 'api_data.g.dart';

@JsonSerializable()
class APIData {
  final bool error;
  final bool success;
  final Map<String, dynamic>? body;
  final List<String>? errors;
  final int statusCode;

  APIData(
      {required this.error,
      this.errors,
      this.body,
      required this.statusCode,
      required this.success});

  factory APIData.fromJson(Map<String, dynamic> json) =>
      _$APIDataFromJson(json);

  Map<String, dynamic> toJson() => _$APIDataToJson(this);
}
