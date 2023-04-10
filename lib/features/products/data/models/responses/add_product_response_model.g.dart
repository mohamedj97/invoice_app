// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductResponseDataModel _$AddProductResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    AddProductResponseDataModel(
      id: json['id'] as int,
      companyId: json['companyId'] as int?,
      code: json['code'] as String?,
      brickcode: json['brickcode'] as String?,
      name: json['name'] as String,
      type: json['type'] as String?,
      description: json['description'] as String?,
      unittypeid: json['unittypeid'] as int?,
      unittypecode: json['unittypecode'] as String?,
      unittypename: json['unittypename'] as String?,
      unittypenamear: json['unittypenamear'] as String?,
      price: json['price'] as num?,
      image: json['image'] as String?,
      active: json['active'] as bool?,
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
      'unittypeid': instance.unittypeid,
      'unittypecode': instance.unittypecode,
      'unittypename': instance.unittypename,
      'unittypenamear': instance.unittypenamear,
      'image': instance.image,
      'active': instance.active,
      'price': instance.price,
    };

AddProductResponse _$AddProductResponseFromJson(Map<String, dynamic> json) =>
    AddProductResponse(
      statuscode: json['statuscode'] as int?,
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
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
