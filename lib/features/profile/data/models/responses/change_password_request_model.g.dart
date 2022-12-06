// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordModel _$ChangePasswordModelFromJson(Map<String, dynamic> json) =>
    ChangePasswordModel(
      json['Username'] as String,
      json['CurrentPassword'] as String,
      json['NewPassword'] as String,
      json['ConfirmNewPassword'] as String,
    );

Map<String, dynamic> _$ChangePasswordModelToJson(
        ChangePasswordModel instance) =>
    <String, dynamic>{
      'Username': instance.Username,
      'CurrentPassword': instance.CurrentPassword,
      'NewPassword': instance.NewPassword,
      'ConfirmNewPassword': instance.ConfirmNewPassword,
    };
