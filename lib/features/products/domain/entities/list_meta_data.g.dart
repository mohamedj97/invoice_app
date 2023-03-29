// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_meta_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListMetaData _$ListMetaDataFromJson(Map<String, dynamic> json) => ListMetaData(
      currentPage: json['currentPage'] as int,
      pageSize: json['pageSize'] as int,
      totalPages: json['totalPages'] as int,
      totalCount: json['totalCount'] as int,
    );

Map<String, dynamic> _$ListMetaDataToJson(ListMetaData instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'pageSize': instance.pageSize,
      'totalPages': instance.totalPages,
      'totalCount': instance.totalCount,
    };
