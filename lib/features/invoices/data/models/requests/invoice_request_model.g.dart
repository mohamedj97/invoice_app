// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceRequestModel _$InvoiceRequestModelFromJson(Map<String, dynamic> json) =>
    InvoiceRequestModel(
      id: json['id'] as int?,
      invoiceNo: json['invoiceNo'] as String?,
      invoiceDate: DateTime.parse(json['invoiceDate'] as String),
      invoiceDirection: json['invoiceDirection'] as int?,
      invoiceType: json['invoiceType'] as int,
      companyId: json['companyId'] as int?,
      branchId: json['branchId'] as int?,
      customerId: json['customerId'] as int,
      customerName: json['customerName'] as String?,
      poNo: json['poNo'] as String?,
      poDesc: json['poDesc'] as String?,
      soNo: json['soNo'] as String?,
      soDesc: json['soDesc'] as String?,
      performaNo: json['performaNo'] as String?,
      totalSalesAmount: json['totalSalesAmount'] as num?,
      totalDiscountAmount: json['totalDiscountAmount'] as num?,
      netAmount: json['netAmount'] as num?,
      extraDiscountAmount: json['extraDiscountAmount'] as num?,
      totalItemDiscountAmount: json['totalItemDiscountAmount'] as num?,
      totalTaxAmount: json['totalTaxAmount'] as num?,
      totalAmount: json['totalAmount'] as num?,
      invoiceLinesCount: json['invoiceLinesCount'] as int?,
      cancelled: json['cancelled'] as bool?,
      cancelledDate: json['cancelledDate'] == null
          ? null
          : DateTime.parse(json['cancelledDate'] as String),
      cancelledBy: json['cancelledBy'] as int?,
      approved: json['approved'] as bool?,
      submitted: json['submitted'] as bool?,
      submittedDate: json['submittedDate'] == null
          ? null
          : DateTime.parse(json['submittedDate'] as String),
      addedDate: json['addedDate'] == null
          ? null
          : DateTime.parse(json['addedDate'] as String),
      updatedDate: json['updatedDate'] == null
          ? null
          : DateTime.parse(json['updatedDate'] as String),
      addedBy: json['addedBy'] as int?,
      updatedBy: json['updatedBy'] as int?,
      reference: json['reference'] as String?,
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      paymentTerms: json['paymentTerms'] as int?,
      paymentTermsComments: json['paymentTermsComments'] as String?,
      invoiceTypeId: json['invoiceTypeId'] as int?,
      invId: json['invId'] as int?,
      uuid: json['uuid'] as String?,
      status: json['status'] as String?,
      statusCode: json['statusCode'] as int?,
      details: json['details'] as String?,
      invoiceDelivery: json['invoiceDelivery'] == null
          ? null
          : InvoiceDelivery.fromJson(
              json['invoiceDelivery'] as Map<String, dynamic>),
      invoicePayment: json['invoicePayment'] == null
          ? null
          : InvoicePayment.fromJson(
              json['invoicePayment'] as Map<String, dynamic>),
      lines: (json['lines'] as List<dynamic>?)
          ?.map((e) => Line.fromJson(e as Map<String, dynamic>))
          .toList(),
      taxs: (json['taxs'] as List<dynamic>?)
          ?.map((e) => InvoiceTax.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InvoiceRequestModelToJson(
        InvoiceRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceNo': instance.invoiceNo,
      'invoiceDate': instance.invoiceDate.toIso8601String(),
      'invoiceDirection': instance.invoiceDirection,
      'invoiceType': instance.invoiceType,
      'companyId': instance.companyId,
      'branchId': instance.branchId,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'poNo': instance.poNo,
      'poDesc': instance.poDesc,
      'soNo': instance.soNo,
      'soDesc': instance.soDesc,
      'performaNo': instance.performaNo,
      'totalSalesAmount': instance.totalSalesAmount,
      'totalDiscountAmount': instance.totalDiscountAmount,
      'netAmount': instance.netAmount,
      'extraDiscountAmount': instance.extraDiscountAmount,
      'totalItemDiscountAmount': instance.totalItemDiscountAmount,
      'totalTaxAmount': instance.totalTaxAmount,
      'totalAmount': instance.totalAmount,
      'invoiceLinesCount': instance.invoiceLinesCount,
      'cancelled': instance.cancelled,
      'cancelledDate': instance.cancelledDate?.toIso8601String(),
      'cancelledBy': instance.cancelledBy,
      'approved': instance.approved,
      'submitted': instance.submitted,
      'submittedDate': instance.submittedDate?.toIso8601String(),
      'addedDate': instance.addedDate?.toIso8601String(),
      'updatedDate': instance.updatedDate?.toIso8601String(),
      'addedBy': instance.addedBy,
      'updatedBy': instance.updatedBy,
      'reference': instance.reference,
      'dueDate': instance.dueDate?.toIso8601String(),
      'paymentTerms': instance.paymentTerms,
      'paymentTermsComments': instance.paymentTermsComments,
      'invoiceTypeId': instance.invoiceTypeId,
      'invId': instance.invId,
      'uuid': instance.uuid,
      'status': instance.status,
      'statusCode': instance.statusCode,
      'details': instance.details,
      'invoiceDelivery': instance.invoiceDelivery?.toJson(),
      'invoicePayment': instance.invoicePayment?.toJson(),
      'lines': instance.lines?.map((e) => e.toJson()).toList(),
      'taxs': instance.taxs?.map((e) => e.toJson()).toList(),
    };
