// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_single_role_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSingleRoleResponseModel _$GetSingleRoleResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetSingleRoleResponseModel(
      role: Role.fromJson(json['role'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetSingleRoleResponseModelToJson(
        GetSingleRoleResponseModel instance) =>
    <String, dynamic>{
      'role': instance.role,
    };

GetSingleRoleResponse _$GetSingleRoleResponseFromJson(
        Map<String, dynamic> json) =>
    GetSingleRoleResponse(
      statuscode: json['statuscode'] as int?,
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      result: json['result'] == null
          ? null
          : GetSingleRoleResponseModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetSingleRoleResponseToJson(
        GetSingleRoleResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'result': instance.result,
    };
