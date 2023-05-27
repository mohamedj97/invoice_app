// To parse this JSON data, do
//
//     final pgPaymentMethodListGenericResponseResult = pgPaymentMethodListGenericResponseResultFromJson(jsonString);

import 'dart:convert';

PgPaymentMethodListGenericResponseResult pgPaymentMethodListGenericResponseResultFromJson(String str) => PgPaymentMethodListGenericResponseResult.fromJson(json.decode(str));

String pgPaymentMethodListGenericResponseResultToJson(PgPaymentMethodListGenericResponseResult data) => json.encode(data.toJson());

class PgPaymentMethodListGenericResponseResult {
  List<PG_PaymentMethod>? result;
  int? status;
  int? statuscode;
  List<String>? message;
  dynamic exception;

  PgPaymentMethodListGenericResponseResult({
    required this.result,
    required this.status,
    required this.statuscode,
    required this.message,
    this.exception,
  });

  factory PgPaymentMethodListGenericResponseResult.fromJson(Map<String, dynamic> json) => PgPaymentMethodListGenericResponseResult(
    result: List<PG_PaymentMethod>.from(json["result"].map((x) => PG_PaymentMethod.fromJson(x))),
    status: json["status"],
    statuscode: json["statuscode"],
    message: List<String>.from(json["message"].map((x) => x)),
    exception: json["exception"],
  );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
    "status": status,
    "statuscode": statuscode,
    "message": List<dynamic>.from(message!.map((x) => x)),
    "exception": exception,
  };
}

class PG_PaymentMethod {
  int paymentId;
  String nameEn;
  String nameAr;
  bool redirect;
  String logo;

  PG_PaymentMethod({
    required this.paymentId,
    required this.nameEn,
    required this.nameAr,
    required this.redirect,
    required this.logo,
  });

  factory PG_PaymentMethod.fromJson(Map<String, dynamic> json) => PG_PaymentMethod(
    paymentId: json["paymentId"],
    nameEn: json["name_en"],
    nameAr: json["name_ar"],
    redirect: json["redirect"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "paymentId": paymentId,
    "name_en": nameEn,
    "name_ar": nameAr,
    "redirect": redirect,
    "logo": logo,
  };
}
