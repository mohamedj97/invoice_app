// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_lookup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemLookup _$ItemLookupFromJson(Map<String, dynamic> json) => ItemLookup(
      code: json['code'] as String?,
      brickCode: json['brickCode'] as String?,
      description: json['description'] as String?,
      unittypeID: json['unittypeID'] as int?,
      id: json['id'] as int,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ItemLookupToJson(ItemLookup instance) =>
    <String, dynamic>{
      'code': instance.code,
      'brickCode': instance.brickCode,
      'description': instance.description,
      'unittypeID': instance.unittypeID,
      'id': instance.id,
      'name': instance.name,
    };
