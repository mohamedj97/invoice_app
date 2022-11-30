// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_invoices_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetInvoicesResponseDataModel _$GetInvoicesResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    GetInvoicesResponseDataModel(
      result: (json['result'] as List<dynamic>)
          .map((e) => InvoiceHeadModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      metData: (json['metData'] as List<dynamic>?)
          ?.map((e) => MetaData.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$GetInvoicesResponseDataModelToJson(
        GetInvoicesResponseDataModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'total': instance.total,
      'metData': instance.metData,
    };

GetInvoicesResponse _$GetInvoicesResponseFromJson(Map<String, dynamic> json) =>
    GetInvoicesResponse(
      statuscode: json['statuscode'] as int?,
      message: json['message'] as String?,
      result: json['result'] == null
          ? null
          : GetInvoicesResponseDataModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetInvoicesResponseToJson(
        GetInvoicesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'result': instance.result,
    };
