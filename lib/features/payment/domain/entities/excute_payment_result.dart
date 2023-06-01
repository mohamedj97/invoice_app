// To parse this JSON data, do
//
//     final paymentGatewayResponseDataGenericResponseResult = paymentGatewayResponseDataGenericResponseResultFromJson(jsonString);

import 'dart:convert';

PaymentGatewayResponseDataGenericResponseResult paymentGatewayResponseDataGenericResponseResultFromJson(String str) =>
    PaymentGatewayResponseDataGenericResponseResult.fromJson(json.decode(str));

String paymentGatewayResponseDataGenericResponseResultToJson(PaymentGatewayResponseDataGenericResponseResult data) =>
    json.encode(data.toJson());

class PaymentGatewayResponseDataGenericResponseResult {
  PaymentGatewayResponseData? result;
  int? status;
  int? statuscode;
  List<String>? message;
  String? exception;

  PaymentGatewayResponseDataGenericResponseResult({
    this.result,
    this.status,
    this.statuscode,
    this.message,
    this.exception,
  });

  factory PaymentGatewayResponseDataGenericResponseResult.fromJson(Map<String, dynamic> json) =>
      PaymentGatewayResponseDataGenericResponseResult(
        result: PaymentGatewayResponseData.fromJson(json["result"]),
        status: json["status"],
        statuscode: json["statuscode"],
        message: List<String>.from(json["message"].map((x) => x)),
        exception: json["exception"],
      );

  Map<String, dynamic> toJson() => {
        "result": result!.toJson(),
        "status": status,
        "statuscode": statuscode,
        "message": List<dynamic>.from(message!.map((x) => x)),
        "exception": exception,
      };
}

class PaymentGatewayResponseData {
  String invoiceId;
  String invoiceKey;
  PaymentData paymentData;

  PaymentGatewayResponseData({
    required this.invoiceId,
    required this.invoiceKey,
    required this.paymentData,
  });

  factory PaymentGatewayResponseData.fromJson(Map<String, dynamic> json) => PaymentGatewayResponseData(
        invoiceId: json["invoice_id"],
        invoiceKey: json["invoice_key"],
        paymentData: PaymentData.fromJson(json["payment_data"]),
      );

  Map<String, dynamic> toJson() => {
        "invoice_id": invoiceId,
        "invoice_key": invoiceKey,
        "payment_data": paymentData.toJson(),
      };
}

class PaymentData {
  String? fawryCode;
  DateTime? expireDate;
  String? meezaReference;
  String? redirectTo;

  PaymentData({
    this.fawryCode,
    this.expireDate,
    this.meezaReference,
    this.redirectTo,
  });

  factory PaymentData.fromJson(Map<String, dynamic> json) => PaymentData(
        fawryCode: json["fawryCode"],
        expireDate: json["expireDate"] == null ? null : DateTime.parse(json["expireDate"]),
        meezaReference: json["meezaReference"],
        redirectTo: json["redirectTo"],
      );

  Map<String, dynamic> toJson() => {
        "fawryCode": fawryCode,
        "expireDate": expireDate?.toIso8601String(),
        "meezaReference": meezaReference,
        "redirectTo": redirectTo,
      };
}
