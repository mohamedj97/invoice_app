// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_single_invoice_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSingleInvoiceResponseDataModel _$GetSingleInvoiceResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    GetSingleInvoiceResponseDataModel(
      id: json['id'] as int,
      invoiceType: json['invoiceType'] as int,
      extraDiscountAmount: json['extraDiscountAmount'] as num?,
      addedDate: json['addedDate'] == null
          ? null
          : DateTime.parse(json['addedDate'] as String),
      updatedDate: json['updatedDate'] == null
          ? null
          : DateTime.parse(json['updatedDate'] as String),
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      paymentTerms: json['paymentTerms'] as int?,
      paymentTermsComments: json['paymentTermsComments'] as String?,
      invoiceNo: json['invoiceNo'] as String?,
      invoiceDate: DateTime.parse(json['invoiceDate'] as String),
      invoiceTypeId: json['invoiceTypeId'] as int,
      customerId: json['customerId'] as int,
      lines: (json['lines'] as List<dynamic>)
          .map((e) => Line.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetSingleInvoiceResponseDataModelToJson(
        GetSingleInvoiceResponseDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceType': instance.invoiceType,
      'addedDate': instance.addedDate?.toIso8601String(),
      'updatedDate': instance.updatedDate?.toIso8601String(),
      'dueDate': instance.dueDate?.toIso8601String(),
      'paymentTerms': instance.paymentTerms,
      'paymentTermsComments': instance.paymentTermsComments,
      'invoiceNo': instance.invoiceNo,
      'invoiceDate': instance.invoiceDate.toIso8601String(),
      'invoiceTypeId': instance.invoiceTypeId,
      'customerId': instance.customerId,
      'extraDiscountAmount': instance.extraDiscountAmount,
      'lines': instance.lines,
    };

GetSingleInvoiceResponse _$GetSingleInvoiceResponseFromJson(
        Map<String, dynamic> json) =>
    GetSingleInvoiceResponse(
      statuscode: json['statuscode'] as int?,
      message: json['message'] as String?,
      result: json['result'] == null
          ? null
          : GetSingleInvoiceResponseDataModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetSingleInvoiceResponseToJson(
        GetSingleInvoiceResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'result': instance.result,
    };
