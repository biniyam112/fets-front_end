import 'package:json_annotation/json_annotation.dart';

part 'api_data.g.dart';

@JsonSerializable()
class APIData {
  final bool error;
  final bool success;
  final dynamic body;
  final List<String>? errors;

  final int? statusCoRde;
  final int? statusCode;
  APIData({
    required this.error,
    this.errors,
    this.body,
    this.statusCoRde,
    this.statusCode,
    required this.success,
  });

  factory APIData.fromJson(Map<String, dynamic> json) =>
      _$APIDataFromJson(json);

  Map<String, dynamic> toJson() => _$APIDataToJson(this);
}
