// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductResponseDataModel _$AddProductResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    AddProductResponseDataModel(
      companyId: json['companyId'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      code: json['code'] as String,
      brickcode: json['brickcode'] as String?,
      type: json['type'] as String?,
      description: json['description'] as String?,
      unittype: json['unittype'] as int?,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$AddProductResponseDataModelToJson(
        AddProductResponseDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'code': instance.code,
      'brickcode': instance.brickcode,
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
      'unittype': instance.unittype,
      'active': instance.active,
    };

AddProductResponse _$AddProductResponseFromJson(Map<String, dynamic> json) =>
    AddProductResponse(
      statuscode: json['statuscode'] as int?,
      message: json['message'] as String?,
      result: json['result'] == null
          ? null
          : AddProductResponseDataModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddProductResponseToJson(AddProductResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'result': instance.result,
    };
