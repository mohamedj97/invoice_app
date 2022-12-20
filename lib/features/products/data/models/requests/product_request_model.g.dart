// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      code: json['code'] as String,
      brickcode: json['brickcode'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      description: json['description'] as String,
      unittype: json['unittype'] as int,
      price: json['price'] as num,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'brickcode': instance.brickcode,
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
      'unittype': instance.unittype,
      'active': instance.active,
      'price': instance.price,
    };
