// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customer_types_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCustomerTypesResponseDataModel _$GetCustomerTypesResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    GetCustomerTypesResponseDataModel(
      result:
          CustomerLookUpResult.fromJson(json['result'] as Map<String, dynamic>),
      metaData: (json['metaData'] as List<dynamic>)
          .map((e) => Meta.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$GetCustomerTypesResponseDataModelToJson(
        GetCustomerTypesResponseDataModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'total': instance.total,
      'metaData': instance.metaData,
    };

GetCustomerTypesResponse _$GetCustomerTypesResponseFromJson(
        Map<String, dynamic> json) =>
    GetCustomerTypesResponse(
      statuscode: json['statuscode'] as int?,
      message: json['message'] as String?,
      result: json['result'] == null
          ? null
          : GetCustomerTypesResponseDataModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCustomerTypesResponseToJson(
        GetCustomerTypesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'result': instance.result,
    };
