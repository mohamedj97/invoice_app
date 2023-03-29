// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemFilter _$ItemFilterFromJson(Map<String, dynamic> json) => ItemFilter(
      freeText: json['freeText'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      brickcode: json['brickcode'] as String?,
      itemType: json['itemType'] as String?,
      description: json['description'] as String?,
      unitType: json['unitType'] as int?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$ItemFilterToJson(ItemFilter instance) =>
    <String, dynamic>{
      'freeText': instance.freeText,
      'code': instance.code,
      'brickcode': instance.brickcode,
      'name': instance.name,
      'itemType': instance.itemType,
      'description': instance.description,
      'unitType': instance.unitType,
      'active': instance.active,
    };
