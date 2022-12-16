// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_lookup_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemLookUpResult _$ItemLookUpResultFromJson(Map<String, dynamic> json) =>
    ItemLookUpResult(
      itemTypes: (json['itemTypes'] as List<dynamic>)
          .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
      unitTypes: (json['unitTypes'] as List<dynamic>)
          .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemLookUpResultToJson(ItemLookUpResult instance) =>
    <String, dynamic>{
      'itemTypes': instance.itemTypes,
      'unitTypes': instance.unitTypes,
    };
