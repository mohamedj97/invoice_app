// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseDataModel _$LoginResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    LoginResponseDataModel(
      token: json['token'] as String,
      expiration: DateTime.parse(json['expiration'] as String),
    );

Map<String, dynamic> _$LoginResponseDataModelToJson(
        LoginResponseDataModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expiration': instance.expiration.toIso8601String(),
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      statusCode: json['statuscode'] as int?,
      errorMessage: json['message'] as String?,
      result: json['result'] == null
          ? null
          : LoginResponseDataModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'message': instance.errorMessage,
      'statuscode': instance.statusCode,
      'result': instance.result,
    };
