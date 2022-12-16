// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_item_types_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetItemTypesResponseDataModel _$GetItemTypesResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    GetItemTypesResponseDataModel(
      result: ItemLookUpResult.fromJson(json['result'] as Map<String, dynamic>),
      meta: (json['meta'] as List<dynamic>)
          .map((e) => Meta.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$GetItemTypesResponseDataModelToJson(
        GetItemTypesResponseDataModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'total': instance.total,
      'meta': instance.meta,
    };

GetItemTypesResponse _$GetItemTypesResponseFromJson(
        Map<String, dynamic> json) =>
    GetItemTypesResponse(
      statuscode: json['statuscode'] as int?,
      message: json['message'] as String?,
      result: json['result'] == null
          ? null
          : GetItemTypesResponseDataModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetItemTypesResponseToJson(
        GetItemTypesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'result': instance.result,
    };
