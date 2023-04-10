// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
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

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
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
