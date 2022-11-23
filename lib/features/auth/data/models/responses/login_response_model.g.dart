// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseDataModel _$LoginResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    LoginResponseDataModel(
      loginId: json['loginId'] as String,
      token: json['token'] as String,
      expiration: DateTime.parse(json['expiration'] as String),
    );

Map<String, dynamic> _$LoginResponseDataModelToJson(
        LoginResponseDataModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expiration': instance.expiration.toIso8601String(),
      'loginId': instance.loginId,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      status: json['status'] as bool,
      errors:
          (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      errorCode: json['errorCode'] as int?,
      errorMessage: json['errorMessage'] as String?,
      result: json['result'] == null
          ? null
          : LoginResponseDataModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'errorMessage': instance.errorMessage,
      'errors': instance.errors,
      'errorCode': instance.errorCode,
      'result': instance.result,
    };
