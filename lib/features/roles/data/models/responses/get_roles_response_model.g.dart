// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_roles_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRolesResponseModel _$GetRolesResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetRolesResponseModel(
      roles: (json['roles'] as List<dynamic>)
          .map((e) => CompanyRole.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetRolesResponseModelToJson(
        GetRolesResponseModel instance) =>
    <String, dynamic>{
      'roles': instance.roles,
    };

GetRolesResponse _$GetRolesResponseFromJson(Map<String, dynamic> json) =>
    GetRolesResponse(
      statuscode: json['statuscode'] as int?,
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      result: json['result'] == null
          ? null
          : GetRolesResponseModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetRolesResponseToJson(GetRolesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'result': instance.result,
    };
