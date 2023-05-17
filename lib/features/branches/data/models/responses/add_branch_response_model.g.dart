// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_branch_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddBranchResponseDataModel _$AddBranchResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    AddBranchResponseDataModel(
      id: json['id'] as int,
      companyId: json['companyId'] as int,
      code: json['code'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      address2: json['address2'] as String?,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$AddBranchResponseDataModelToJson(
        AddBranchResponseDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'code': instance.code,
      'name': instance.name,
      'address': instance.address,
      'address2': instance.address2,
      'active': instance.active,
    };

AddBranchResponse _$AddBranchResponseFromJson(Map<String, dynamic> json) =>
    AddBranchResponse(
      statuscode: json['statuscode'] as int?,
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      result: json['result'] == null
          ? null
          : AddBranchResponseDataModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddBranchResponseToJson(AddBranchResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'result': instance.result,
    };
