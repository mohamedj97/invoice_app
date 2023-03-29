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
      metaData: (json['metaData'] as List<dynamic>)
          .map((e) => MetaDataData.fromJson(e as Map<String, dynamic>))
          .toList(),
      listMetadata:
          ListMetaData.fromJson(json['listMetadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetInvoicesResponseDataModelToJson(
        GetInvoicesResponseDataModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'listMetadata': instance.listMetadata,
      'metaData': instance.metaData,
    };

GetInvoicesResponse _$GetInvoicesResponseFromJson(Map<String, dynamic> json) =>
    GetInvoicesResponse(
      statuscode: json['statuscode'] as int?,
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
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
