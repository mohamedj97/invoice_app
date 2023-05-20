// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_lookup_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserLookupResponseModel _$GetUserLookupResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetUserLookupResponseModel(
      companybranchs: (json['companybranchs'] as List<dynamic>)
          .map((e) => CompanyBranch.fromJson(e as Map<String, dynamic>))
          .toList(),
      userRoles: (json['userRoles'] as List<dynamic>)
          .map((e) => CompanyRole.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetUserLookupResponseModelToJson(
        GetUserLookupResponseModel instance) =>
    <String, dynamic>{
      'companybranchs': instance.companybranchs,
      'userRoles': instance.userRoles,
    };

GetUserLookupResponse _$GetUserLookupResponseFromJson(
        Map<String, dynamic> json) =>
    GetUserLookupResponse(
      statuscode: json['statuscode'] as int?,
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      result: json['result'] == null
          ? null
          : GetUserLookupResponseModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUserLookupResponseToJson(
        GetUserLookupResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'result': instance.result,
    };
