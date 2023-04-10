// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_products_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductFilterGenericFilterModel _$ProductFilterGenericFilterModelFromJson(
        Map<String, dynamic> json) =>
    ProductFilterGenericFilterModel(
      sortBy: json['sortBy'] as String?,
      sortDir: json['sortDir'] as String?,
      filter: json['filter'] == null
          ? null
          : ItemFilter.fromJson(json['filter'] as Map<String, dynamic>),
      pageNo: json['pageNo'] as int,
      pageSize: json['pageSize'] as int,
    );

Map<String, dynamic> _$ProductFilterGenericFilterModelToJson(
        ProductFilterGenericFilterModel instance) =>
    <String, dynamic>{
      'filter': instance.filter?.toJson(),
      'pageNo': instance.pageNo,
      'pageSize': instance.pageSize,
      'sortBy': instance.sortBy,
      'sortDir': instance.sortDir,
    };
