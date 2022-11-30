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
      statuscode: json['statuscode'] as int?,
      message: json['message'] as String?,
      result: json['result'] == null
          ? null
          : LoginResponseDataModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'result': instance.result,
    };
