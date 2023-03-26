// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterResponseDataModel _$RegisterResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    RegisterResponseDataModel(
      securityCodeValideTime: json['securityCodeValideTime'] as int,
      userId: json['userId'] as int,
      email: json['email'] as String,
      active: json['active'] as bool,
      selcompany: json['selcompany'] as int,
      token: json['token'] as String?,
      loginId: json['loginId'] as String?,
    );

Map<String, dynamic> _$RegisterResponseDataModelToJson(
        RegisterResponseDataModel instance) =>
    <String, dynamic>{
      'securityCodeValideTime': instance.securityCodeValideTime,
      'userId': instance.userId,
      'email': instance.email,
      'token': instance.token,
      'loginId': instance.loginId,
      'active': instance.active,
      'selcompany': instance.selcompany,
    };

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      statuscode: json['statuscode'] as int?,
      message: json['message'] as String?,
      result: json['result'] == null
          ? null
          : RegisterResponseDataModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'result': instance.result,
    };
