// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_products_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductsResponseDataModel _$GetProductsResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    GetProductsResponseDataModel(
      result: (json['result'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: (json['meta'] as List<dynamic>)
          .map((e) => Meta.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$GetProductsResponseDataModelToJson(
        GetProductsResponseDataModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'total': instance.total,
      'meta': instance.meta,
    };

GetProductsResponse _$GetProductsResponseFromJson(Map<String, dynamic> json) =>
    GetProductsResponse(
      statuscode: json['statuscode'] as int?,
      message: json['message'] as String?,
      result: json['result'] == null
          ? null
          : GetProductsResponseDataModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetProductsResponseToJson(
        GetProductsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'result': instance.result,
    };
