// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_feed_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIFeedData _$APIFeedDataFromJson(Map<String, dynamic> json) => APIFeedData(
      id: json['id'] as int,
      description: json['description'] as String,
      image: json['image'] as String,
      metadata: json['metadata'] as String,
      title: json['title'] as String,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$APIFeedDataToJson(APIFeedData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'title': instance.title,
      'metadata': instance.metadata,
      'image': instance.image,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
