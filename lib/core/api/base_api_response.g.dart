// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseAPIResponse _$BaseAPIResponseFromJson(Map<String, dynamic> json) =>
    BaseAPIResponse(
      status: json['status'] as bool,
      errorMessage: json['errorMessage'] as String?,
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      errorCode: json['errorCode'] as int?,
    );

Map<String, dynamic> _$BaseAPIResponseToJson(BaseAPIResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'errorMessage': instance.errorMessage,
      'errors': instance.errors,
      'errorCode': instance.errorCode,
    };

BoolResponse _$BoolResponseFromJson(Map<String, dynamic> json) => BoolResponse(
      result: json['result'] as bool,
      errorCode: json['errorCode'] as int?,
      errorMessage: json['errorMessage'] as String?,
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'] as bool,
    );

Map<String, dynamic> _$BoolResponseToJson(BoolResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'errorMessage': instance.errorMessage,
      'errors': instance.errors,
      'errorCode': instance.errorCode,
      'result': instance.result,
    };

StringResponse _$StringResponseFromJson(Map<String, dynamic> json) =>
    StringResponse(
      result: json['result'] as String,
      errorCode: json['errorCode'] as int?,
      errorMessage: json['errorMessage'] as String?,
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'] as bool,
    );

Map<String, dynamic> _$StringResponseToJson(StringResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'errorMessage': instance.errorMessage,
      'errors': instance.errors,
      'errorCode': instance.errorCode,
      'result': instance.result,
    };

StringsListResponse _$StringsListResponseFromJson(Map<String, dynamic> json) =>
    StringsListResponse(
      result:
          (json['result'] as List<dynamic>).map((e) => e as String).toList(),
      errorCode: json['errorCode'] as int?,
      errorMessage: json['errorMessage'] as String?,
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'] as bool,
    );

Map<String, dynamic> _$StringsListResponseToJson(
        StringsListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'errorMessage': instance.errorMessage,
      'errors': instance.errors,
      'errorCode': instance.errorCode,
      'result': instance.result,
    };

IntResponse _$IntResponseFromJson(Map<String, dynamic> json) => IntResponse(
      result: json['result'] as int,
      errorCode: json['errorCode'] as int?,
      errorMessage: json['errorMessage'] as String?,
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'] as bool,
    );

Map<String, dynamic> _$IntResponseToJson(IntResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'errorMessage': instance.errorMessage,
      'errors': instance.errors,
      'errorCode': instance.errorCode,
      'result': instance.result,
    };
