// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCompany _$UserCompanyFromJson(Map<String, dynamic> json) => UserCompany(
      companyInfo:
          CompanyInfo.fromJson(json['companyInfo'] as Map<String, dynamic>),
      branches: (json['branches'] as List<dynamic>)
          .map((e) => UserCompanyBranch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserCompanyToJson(UserCompany instance) =>
    <String, dynamic>{
      'companyInfo': instance.companyInfo,
      'branches': instance.branches,
    };
