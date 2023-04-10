// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customers_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerFilterGenericFilterModel _$CustomerFilterGenericFilterModelFromJson(
        Map<String, dynamic> json) =>
    CustomerFilterGenericFilterModel(
      sortBy: json['sortBy'] as String?,
      sortDir: json['sortDir'] as String?,
      filter: json['filter'] == null
          ? null
          : CustomerFilter.fromJson(json['filter'] as Map<String, dynamic>),
      pageNo: json['pageNo'] as int,
      pageSize: json['pageSize'] as int,
    );

Map<String, dynamic> _$CustomerFilterGenericFilterModelToJson(
        CustomerFilterGenericFilterModel instance) =>
    <String, dynamic>{
      'filter': instance.filter?.toJson(),
      'pageNo': instance.pageNo,
      'pageSize': instance.pageSize,
      'sortBy': instance.sortBy,
      'sortDir': instance.sortDir,
    };
