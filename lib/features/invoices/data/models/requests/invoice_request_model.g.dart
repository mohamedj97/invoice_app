// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceRequestModel _$InvoiceRequestModelFromJson(Map<String, dynamic> json) =>
    InvoiceRequestModel(
      id: json['id'] as int,
      invoiceType: json['invoiceType'] as String,
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
      extraDiscountAmount: json['extraDiscountAmount'] as num?,
      paymentTermsComments: json['paymentTermsComments'] as String?,
      invoiceNo: json['invoiceNo'] as String?,
      invoiceDate: DateTime.parse(json['invoiceDate'] as String),
      invoiceTypeId: json['invoiceTypeId'] as int,
      customerId: json['customerId'] as int,
      lines: (json['lines'] as List<dynamic>)
          .map((e) => Line.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InvoiceRequestModelToJson(
        InvoiceRequestModel instance) =>
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
      'lines':instance.lines.map((e) => e.toJson()).toList(),
    };
