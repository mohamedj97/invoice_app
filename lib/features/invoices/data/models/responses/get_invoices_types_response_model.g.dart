// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_invoices_types_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetInvoiceTypesResponseDataModel _$GetInvoiceTypesResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    GetInvoiceTypesResponseDataModel(
      result:
          InvoiceLookUpResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetInvoiceTypesResponseDataModelToJson(
        GetInvoiceTypesResponseDataModel instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

GetInvoiceTypesResponse _$GetInvoiceTypesResponseFromJson(
        Map<String, dynamic> json) =>
    GetInvoiceTypesResponse(
      statuscode: json['statuscode'] as int?,
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      result: json['result'] == null
          ? null
          : GetInvoiceTypesResponseDataModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetInvoiceTypesResponseToJson(
        GetInvoiceTypesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'result': instance.result,
    };
