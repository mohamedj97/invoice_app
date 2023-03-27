// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_code_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidateCodeResponseDataModel _$ValidateCodeResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    ValidateCodeResponseDataModel(
      Email: json['Email'] as String,
      Username: json['Username'] as String,
    );

Map<String, dynamic> _$ValidateCodeResponseDataModelToJson(
        ValidateCodeResponseDataModel instance) =>
    <String, dynamic>{
      'Email': instance.Email,
      'Username': instance.Username,
    };

ValidateCodeResponse _$ValidateCodeResponseFromJson(
        Map<String, dynamic> json) =>
    ValidateCodeResponse(
      statuscode: json['statuscode'] as int?,
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      result: json['result'] == null
          ? null
          : ValidateCodeResponse.fromJson(
              json['result'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$ValidateCodeResponseToJson(
        ValidateCodeResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'result': instance.result,
    };
