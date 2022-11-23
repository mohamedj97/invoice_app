// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenDataModel _$TokenDataModelFromJson(Map<String, dynamic> json) =>
    TokenDataModel(
      token: json['token'] as String,
      loginId: json['loginId'] as String,
      expiration: DateTime.parse(json['expiration'] as String),
    );

Map<String, dynamic> _$TokenDataModelToJson(TokenDataModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'loginId': instance.loginId,
      'expiration': instance.expiration.toIso8601String(),
    };
