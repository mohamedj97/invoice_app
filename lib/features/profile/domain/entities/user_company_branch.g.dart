// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_company_branch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCompanyBranch _$UserCompanyBranchFromJson(Map<String, dynamic> json) =>
    UserCompanyBranch(
      branch: CompanyBranch.fromJson(json['branch'] as Map<String, dynamic>),
      roles: (json['roles'] as List<dynamic>)
          .map((e) => CompanyRole.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserCompanyBranchToJson(UserCompanyBranch instance) =>
    <String, dynamic>{
      'branch': instance.branch,
      'roles': instance.roles,
    };
