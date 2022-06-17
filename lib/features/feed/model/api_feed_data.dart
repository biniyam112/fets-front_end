import 'package:json_annotation/json_annotation.dart';

part 'api_feed_data.g.dart';

@JsonSerializable()
class APIFeedData {
  final int id;
  final String description;
  final String title;
  final String metadata;
  final String image;
  final String? createdAt;
  final String? updatedAt;

  APIFeedData(
      {required this.id,
      required this.description,
      required this.image,
      required this.metadata,
      required this.title,
      this.createdAt,
      this.updatedAt});

  factory APIFeedData.fromJson(Map<String, dynamic> json) =>
      _$APIFeedDataFromJson(json);

  Map<String, dynamic> toJson() => _$APIFeedDataToJson(this);
}
