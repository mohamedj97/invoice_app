// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoicePayment _$InvoicePaymentFromJson(Map<String, dynamic> json) =>
    InvoicePayment(
      id: json['id'] as int,
      invoiceId: json['invoiceId'] as int,
      bankname: json['bankname'] as String?,
      bankaddress: json['bankaddress'] as String?,
      bankaccountno: json['bankaccountno'] as String?,
      bankaccountiban: json['bankaccountiban'] as String?,
      swiftcode: json['swiftcode'] as String?,
      terms: json['terms'] as String?,
    );

Map<String, dynamic> _$InvoicePaymentToJson(InvoicePayment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceId': instance.invoiceId,
      'bankname': instance.bankname,
      'bankaddress': instance.bankaddress,
      'bankaccountno': instance.bankaccountno,
      'bankaccountiban': instance.bankaccountiban,
      'swiftcode': instance.swiftcode,
      'terms': instance.terms,
    };
