// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_filter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductFilterRequest _$ProductFilterRequestFromJson(
        Map<String, dynamic> json) =>
    ProductFilterRequest(
      filter: json['filter'] == null
          ? null
          : ItemFilter.fromJson(json['filter'] as Map<String, dynamic>),
      pageNo: json['pageNo'] as int,
      pageSize: json['pageSize'] as int,
      sortBy: json['sortBy'] as String?,
      sortDir: json['sortDir'] as String?,
    );

Map<String, dynamic> _$ProductFilterRequestToJson(
        ProductFilterRequest instance) =>
    <String, dynamic>{
      'filter': instance.filter,
      'pageNo': instance.pageNo,
      'pageSize': instance.pageSize,
      'sortBy': instance.sortBy,
      'sortDir': instance.sortDir,
    };
