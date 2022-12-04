// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyRole _$CompanyRoleFromJson(Map<String, dynamic> json) => CompanyRole(
      id: json['id'] as int,
      companyId: json['companyId'] as int,
      roleName: json['roleName'] as String?,
      roleDescription: json['roleDescription'] as String?,
      canEdit: json['canEdit'] as bool?,
      active: json['active'] as bool?,
      canView: json['canView'] as bool?,
    );

Map<String, dynamic> _$CompanyRoleToJson(CompanyRole instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'roleName': instance.roleName,
      'roleDescription': instance.roleDescription,
      'canEdit': instance.canEdit,
      'canView': instance.canView,
      'active': instance.active,
    };
