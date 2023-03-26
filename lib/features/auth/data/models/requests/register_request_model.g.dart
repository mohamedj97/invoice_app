// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      Username: json['Username'] as String,
      Password: json['Password'] as String,
      ConfirmedPassword: json['ConfirmedPassword'] as String,
      Email: json['Email'] as String,
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'Username': instance.Username,
      'Password': instance.Password,
      'ConfirmedPassword': instance.ConfirmedPassword,
      'Email': instance.Email,
    };
