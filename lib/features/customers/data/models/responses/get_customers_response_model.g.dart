// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customers_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCustomersResponseDataModel _$GetCustomersResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    GetCustomersResponseDataModel(
      result: (json['result'] as List<dynamic>)
          .map((e) => CustomerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
      metaData: (json['metaData'] as List<dynamic>)
          .map((e) => MetaDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCustomersResponseDataModelToJson(
        GetCustomersResponseDataModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'total': instance.total,
      'metaData': instance.metaData,
    };

GetCustomersResponse _$GetCustomersResponseFromJson(
        Map<String, dynamic> json) =>
    GetCustomersResponse(
      statuscode: json['statuscode'] as int?,
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      result: json['result'] == null
          ? null
          : GetCustomersResponseDataModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCustomersResponseToJson(
        GetCustomersResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'result': instance.result,
    };
