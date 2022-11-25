// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseAPIResponse _$BaseAPIResponseFromJson(Map<String, dynamic> json) =>
    BaseAPIResponse(
      errorMessage: json['message'] as String?,
      statusCode: json['statuscode'] as int?,
    );

Map<String, dynamic> _$BaseAPIResponseToJson(BaseAPIResponse instance) =>
    <String, dynamic>{
      'message': instance.errorMessage,
      'statuscode': instance.statusCode,
    };

BoolResponse _$BoolResponseFromJson(Map<String, dynamic> json) => BoolResponse(
      result: json['result'] as bool,
      errorMessage: json['message'] as String?,
      statusCode: json['statuscode'] as int?,
    );

Map<String, dynamic> _$BoolResponseToJson(BoolResponse instance) =>
    <String, dynamic>{
      'message': instance.errorMessage,
      'statuscode': instance.statusCode,
      'result': instance.result,
    };

StringResponse _$StringResponseFromJson(Map<String, dynamic> json) =>
    StringResponse(
      result: json['result'] as String,
      statusCode: json['statuscode'] as int?,
      errorMessage: json['message'] as String?,
    );

Map<String, dynamic> _$StringResponseToJson(StringResponse instance) =>
    <String, dynamic>{
      'message': instance.errorMessage,
      'statuscode': instance.statusCode,
      'result': instance.result,
    };

StringsListResponse _$StringsListResponseFromJson(Map<String, dynamic> json) =>
    StringsListResponse(
      result:
          (json['result'] as List<dynamic>).map((e) => e as String).toList(),
      statusCode: json['statuscode'] as int?,
      errorMessage: json['message'] as String?,
    );

Map<String, dynamic> _$StringsListResponseToJson(
        StringsListResponse instance) =>
    <String, dynamic>{
      'message': instance.errorMessage,
      'statuscode': instance.statusCode,
      'result': instance.result,
    };

IntResponse _$IntResponseFromJson(Map<String, dynamic> json) => IntResponse(
      result: json['result'] as int,
      statusCode: json['statuscode'] as int?,
      errorMessage: json['message'] as String?,
    );

Map<String, dynamic> _$IntResponseToJson(IntResponse instance) =>
    <String, dynamic>{
      'message': instance.errorMessage,
      'statuscode': instance.statusCode,
      'result': instance.result,
    };
