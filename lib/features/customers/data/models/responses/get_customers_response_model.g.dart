// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customers_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCustomersResponseDataModel _$GetCustomersResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    GetCustomersResponseDataModel(
      Result: (json['Result'] as List<dynamic>)
          .map((e) => CustomerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
      metData: (json['metData'] as List<dynamic>)
          .map((e) => MetaData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCustomersResponseDataModelToJson(
        GetCustomersResponseDataModel instance) =>
    <String, dynamic>{
      'Result': instance.Result,
      'total': instance.total,
      'metData': instance.metData,
    };

GetCustomersResponse _$GetCustomersResponseFromJson(
        Map<String, dynamic> json) =>
    GetCustomersResponse(
      statusCode: json['statusCode'] as int?,
      errorMessage: json['errorMessage'] as String?,
      result: json['result'] == null
          ? null
          : GetCustomersResponseDataModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCustomersResponseToJson(
        GetCustomersResponse instance) =>
    <String, dynamic>{
      'errorMessage': instance.errorMessage,
      'statusCode': instance.statusCode,
      'result': instance.result,
    };
