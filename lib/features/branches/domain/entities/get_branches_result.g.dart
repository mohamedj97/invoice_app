// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_branches_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBranchesResult _$GetBranchesResultFromJson(Map<String, dynamic> json) =>
    GetBranchesResult(
      branches: (json['branches'] as List<dynamic>)
          .map((e) => CompanyBranch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBranchesResultToJson(GetBranchesResult instance) =>
    <String, dynamic>{
      'branches': instance.branches,
    };
