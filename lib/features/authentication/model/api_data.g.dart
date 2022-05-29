// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIData _$APIDataFromJson(Map<String, dynamic> json) => APIData(
      error: json['error'] as bool,
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      body: json['body'] as Map<String, dynamic>?,
      statusCode: json['statusCode'] as int,
      success: json['success'] as bool,
    );

Map<String, dynamic> _$APIDataToJson(APIData instance) => <String, dynamic>{
      'error': instance.error,
      'success': instance.success,
      'body': instance.body,
      'errors': instance.errors,
      'statusCode': instance.statusCode,
    };
