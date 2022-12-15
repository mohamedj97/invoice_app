// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      json['id'] as int,
      json['companyId'] as int,
      json['code'] as String,
      json['brickcode'] as String,
      json['name'] as String,
      json['type'] as String,
      json['description'] as String,
      json['unittype'] as int,
      json['active'] as bool,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
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
