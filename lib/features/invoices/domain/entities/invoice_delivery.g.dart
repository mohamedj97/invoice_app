// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_delivery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceDelivery _$InvoiceDeliveryFromJson(Map<String, dynamic> json) =>
    InvoiceDelivery(
      id: json['id'] as int,
      invoiceId: json['invoiceId'] as int,
      approch: json['approch'] as String?,
      packaging: json['packaging'] as String?,
      dateValidity: json['dateValidity'] == null
          ? null
          : DateTime.parse(json['dateValidity'] as String),
      exportPort: json['exportPort'] as String?,
      countryOfOrigin: json['countryOfOrigin'] as int?,
      grossWeight: json['grossWeight'] as num?,
      netWeight: json['netWeight'] as num?,
      terms: json['terms'] as String?,
    );

Map<String, dynamic> _$InvoiceDeliveryToJson(InvoiceDelivery instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceId': instance.invoiceId,
      'approch': instance.approch,
      'packaging': instance.packaging,
      'dateValidity': instance.dateValidity?.toIso8601String(),
      'exportPort': instance.exportPort,
      'countryOfOrigin': instance.countryOfOrigin,
      'grossWeight': instance.grossWeight,
      'netWeight': instance.netWeight,
      'terms': instance.terms,
    };
