// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_roles_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRolesResult _$GetRolesResultFromJson(Map<String, dynamic> json) =>
    GetRolesResult(
      roles: (json['roles'] as List<dynamic>)
          .map((e) => CompanyRole.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetRolesResultToJson(GetRolesResult instance) =>
    <String, dynamic>{
      'roles': instance.roles,
    };
