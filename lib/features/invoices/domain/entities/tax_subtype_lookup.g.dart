// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_subtype_lookup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxSubtypeLookup _$TaxSubtypeLookupFromJson(Map<String, dynamic> json) =>
    TaxSubtypeLookup(
      code: json['code'] as String?,
      id: json['id'] as int,
      taxTypeId: json['taxTypeId'] as int,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$TaxSubtypeLookupToJson(TaxSubtypeLookup instance) =>
    <String, dynamic>{
      'code': instance.code,
      'id': instance.id,
      'name': instance.name,
      'taxTypeId': instance.taxTypeId,
    };
