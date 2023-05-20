// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_lookup_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserLookupResult _$GetUserLookupResultFromJson(Map<String, dynamic> json) =>
    GetUserLookupResult(
      companybranchs: (json['companybranchs'] as List<dynamic>)
          .map((e) => CompanyBranch.fromJson(e as Map<String, dynamic>))
          .toList(),
      userRoles: (json['userRoles'] as List<dynamic>)
          .map((e) => CompanyRole.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUserLookupResultToJson(
        GetUserLookupResult instance) =>
    <String, dynamic>{
      'companybranchs': instance.companybranchs,
      'userRoles': instance.userRoles,
    };
