// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_branch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyBranch _$CompanyBranchFromJson(Map<String, dynamic> json) =>
    CompanyBranch(
      id: json['id'] as int,
      companyid: json['companyid'] as int,
      code: json['code'] as String,
      name: json['name'] as String,
      address: json['address'] as String?,
      address2: json['address2'] as String?,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$CompanyBranchToJson(CompanyBranch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyid': instance.companyid,
      'code': instance.code,
      'name': instance.name,
      'address': instance.address,
      'address2': instance.address2,
      'active': instance.active,
    };
