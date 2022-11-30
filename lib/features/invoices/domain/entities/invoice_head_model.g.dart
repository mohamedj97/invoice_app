// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_head_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceHeadModel _$InvoiceHeadModelFromJson(Map<String, dynamic> json) =>
    InvoiceHeadModel(
      id: json['id'] as int,
      invoiceNo: json['invoiceNo'] as String?,
      invoiceDate: DateTime.parse(json['invoiceDate'] as String),
      direction: json['direction'] as String?,
      companyCode: json['companyCode'] as String?,
      companyName: json['companyName'] as String?,
      companyTaxRegId: json['companyTaxRegId'] as num,
      companyCountry: json['companyCountry'] as String?,
      companyGovernate: json['companyGovernate'] as String?,
      companyCity: json['companyCity'] as String?,
      companyStreet: json['companyStreet'] as String?,
      companyBuildingNo: json['companyBuildingNo'] as String?,
      customerCode: json['customerCode'] as String?,
      customerName: json['customerName'] as String?,
      customerTaxRegId: json['customerTaxRegId'] as String?,
      customerCountry: json['customerCountry'] as String?,
      customerGovernate: json['customerGovernate'] as String?,
      customerCity: json['customerCity'] as String?,
      customerStreet: json['customerStreet'] as String?,
      customerBuildingNo: json['customerBuildingNo'] as String?,
      poNo: json['poNo'] as String?,
      poDesc: json['poDesc'] as String?,
      soNo: json['soNo'] as String?,
      soDesc: json['soDesc'] as String?,
      performaNo: json['performaNo'] as String?,
      bankName: json['bankName'] as String?,
      bankAddress: json['bankAddress'] as String?,
      bankAccountNo: json['bankAccountNo'] as String?,
      bankAccountIban: json['bankAccountIban'] as String?,
      swiftCode: json['swiftCode'] as String?,
      paymentTerms: json['paymentTerms'] as String?,
      approch: json['approch'] as String?,
      packaging: json['packaging'] as String?,
      dateValidity: json['dateValidity'] == null
          ? null
          : DateTime.parse(json['dateValidity'] as String),
      exportPort: json['exportPort'] as String?,
      countryOfOrigin: json['countryOfOrigin'] as int?,
      grossWeight: json['grossWeight'] as num?,
      netWeight: json['netWeight'] as num?,
      deliveryTerms: json['deliveryTerms'] as String?,
      invoiceTypeCode: json['invoiceTypeCode'] as String?,
      invoiceTypeName: json['invoiceTypeName'] as String?,
      extraDiscountAmount: json['extraDiscountAmount'] as num?,
      totalSalesAmount: json['totalSalesAmount'] as num?,
      totalDiscountAmount: json['totalDiscountAmount'] as num?,
      netAmount: json['netAmount'] as num?,
      totalItemDiscountAmount: json['totalItemDiscountAmount'] as num?,
      totalAmount: json['totalAmount'] as num?,
      invoiceLinesCount: json['invoiceLinesCount'] as int?,
      reference: json['reference'] as String?,
      companyId: json['companyId'] as int,
      branchId: json['branchId'] as int,
      companyActivityId: json['companyActivityId'] as int,
      companyActivityCode: json['companyActivityCode'] as String?,
      companyActivityName: json['companyActivityName'] as String?,
      companyCountryCode: json['companyCountryCode'] as String?,
      customerId: json['customerId'] as int,
      invoiceType: json['invoiceType'] as String?,
      invId: json['invId'] as int?,
      uuid: json['uuid'] as String?,
      status: json['status'] as String?,
      statusCode: json['statusCode'] as int?,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$InvoiceHeadModelToJson(InvoiceHeadModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceNo': instance.invoiceNo,
      'invoiceDate': instance.invoiceDate.toIso8601String(),
      'direction': instance.direction,
      'companyCode': instance.companyCode,
      'companyName': instance.companyName,
      'companyTaxRegId': instance.companyTaxRegId,
      'companyCountry': instance.companyCountry,
      'companyGovernate': instance.companyGovernate,
      'companyCity': instance.companyCity,
      'companyStreet': instance.companyStreet,
      'companyBuildingNo': instance.companyBuildingNo,
      'customerCode': instance.customerCode,
      'customerName': instance.customerName,
      'customerTaxRegId': instance.customerTaxRegId,
      'customerCountry': instance.customerCountry,
      'customerGovernate': instance.customerGovernate,
      'customerCity': instance.customerCity,
      'customerStreet': instance.customerStreet,
      'customerBuildingNo': instance.customerBuildingNo,
      'poNo': instance.poNo,
      'poDesc': instance.poDesc,
      'soNo': instance.soNo,
      'soDesc': instance.soDesc,
      'performaNo': instance.performaNo,
      'bankName': instance.bankName,
      'bankAddress': instance.bankAddress,
      'bankAccountNo': instance.bankAccountNo,
      'bankAccountIban': instance.bankAccountIban,
      'swiftCode': instance.swiftCode,
      'paymentTerms': instance.paymentTerms,
      'approch': instance.approch,
      'packaging': instance.packaging,
      'dateValidity': instance.dateValidity?.toIso8601String(),
      'exportPort': instance.exportPort,
      'countryOfOrigin': instance.countryOfOrigin,
      'grossWeight': instance.grossWeight,
      'netWeight': instance.netWeight,
      'deliveryTerms': instance.deliveryTerms,
      'invoiceTypeCode': instance.invoiceTypeCode,
      'invoiceTypeName': instance.invoiceTypeName,
      'extraDiscountAmount': instance.extraDiscountAmount,
      'totalSalesAmount': instance.totalSalesAmount,
      'totalDiscountAmount': instance.totalDiscountAmount,
      'netAmount': instance.netAmount,
      'totalItemDiscountAmount': instance.totalItemDiscountAmount,
      'totalAmount': instance.totalAmount,
      'invoiceLinesCount': instance.invoiceLinesCount,
      'reference': instance.reference,
      'companyId': instance.companyId,
      'branchId': instance.branchId,
      'companyActivityId': instance.companyActivityId,
      'companyActivityCode': instance.companyActivityCode,
      'companyActivityName': instance.companyActivityName,
      'companyCountryCode': instance.companyCountryCode,
      'customerId': instance.customerId,
      'invoiceType': instance.invoiceType,
      'invId': instance.invId,
      'uuid': instance.uuid,
      'status': instance.status,
      'statusCode': instance.statusCode,
      'details': instance.details,
    };
