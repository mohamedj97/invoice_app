// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_filter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerFilterRequest _$CustomerFilterRequestFromJson(
        Map<String, dynamic> json) =>
    CustomerFilterRequest(
      filter: json['filter'] == null
          ? null
          : CustomerFilter.fromJson(json['filter'] as Map<String, dynamic>),
      pageNo: json['pageNo'] as int,
      pageSize: json['pageSize'] as int,
      sortBy: json['sortBy'] as String?,
      sortDir: json['sortDir'] as String?,
    );

Map<String, dynamic> _$CustomerFilterRequestToJson(
        CustomerFilterRequest instance) =>
    <String, dynamic>{
      'filter': instance.filter,
      'pageNo': instance.pageNo,
      'pageSize': instance.pageSize,
      'sortBy': instance.sortBy,
      'sortDir': instance.sortDir,
    };
