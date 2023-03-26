// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_submitted_invoices_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSubmittedInvoiceResponseDataModel
    _$GetSubmittedInvoiceResponseDataModelFromJson(Map<String, dynamic> json) =>
        GetSubmittedInvoiceResponseDataModel(
          invoicesTotal_Daily: InvoicesTotals.fromJson(
              json['invoicesTotal_Daily'] as Map<String, dynamic>),
          creditTotal_Daily: InvoicesTotals.fromJson(
              json['creditTotal_Daily'] as Map<String, dynamic>),
          total_Daily: InvoicesTotals.fromJson(
              json['total_Daily'] as Map<String, dynamic>),
          invoicesTotal_Monthly: InvoicesTotals.fromJson(
              json['invoicesTotal_Monthly'] as Map<String, dynamic>),
          creditTotal_Monthly: InvoicesTotals.fromJson(
              json['creditTotal_Monthly'] as Map<String, dynamic>),
          total_Monthly: InvoicesTotals.fromJson(
              json['total_Monthly'] as Map<String, dynamic>),
          invoicesTotal_Yearly: InvoicesTotals.fromJson(
              json['invoicesTotal_Yearly'] as Map<String, dynamic>),
          creditTotal_Yearly: InvoicesTotals.fromJson(
              json['creditTotal_Yearly'] as Map<String, dynamic>),
          total_Yearly: InvoicesTotals.fromJson(
              json['total_Yearly'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$GetSubmittedInvoiceResponseDataModelToJson(
        GetSubmittedInvoiceResponseDataModel instance) =>
    <String, dynamic>{
      'invoicesTotal_Daily': instance.invoicesTotal_Daily,
      'creditTotal_Daily': instance.creditTotal_Daily,
      'total_Daily': instance.total_Daily,
      'invoicesTotal_Monthly': instance.invoicesTotal_Monthly,
      'creditTotal_Monthly': instance.creditTotal_Monthly,
      'total_Monthly': instance.total_Monthly,
      'invoicesTotal_Yearly': instance.invoicesTotal_Yearly,
      'creditTotal_Yearly': instance.creditTotal_Yearly,
      'total_Yearly': instance.total_Yearly,
    };

GetSubmittedInvoiceResponse _$GetSubmittedInvoiceResponseFromJson(
        Map<String, dynamic> json) =>
    GetSubmittedInvoiceResponse(
      statuscode: json['statuscode'] as int?,
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      result: json['result'] == null
          ? null
          : GetSubmittedInvoiceResponseDataModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetSubmittedInvoiceResponseToJson(
        GetSubmittedInvoiceResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'result': instance.result,
    };
