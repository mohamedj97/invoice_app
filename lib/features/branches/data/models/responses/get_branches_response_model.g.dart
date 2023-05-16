// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_branches_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBranchesResponseModel _$GetBranchesResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetBranchesResponseModel(
      branches: (json['branches'] as List<dynamic>)
          .map((e) => CompanyBranch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBranchesResponseModelToJson(
        GetBranchesResponseModel instance) =>
    <String, dynamic>{
      'branches': instance.branches,
    };

GetBranchesResponse _$GetBranchesResponseFromJson(Map<String, dynamic> json) =>
    GetBranchesResponse(
      statuscode: json['statuscode'] as int?,
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      result: json['result'] == null
          ? null
          : GetBranchesResponseModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetBranchesResponseToJson(
        GetBranchesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'result': instance.result,
    };
