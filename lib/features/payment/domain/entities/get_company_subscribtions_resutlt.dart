// To parse this JSON data, do
//
//     final companySubscriptionResult = companySubscriptionResultFromJson(jsonString);

import 'dart:convert';

CompanySubscriptionResult companySubscriptionResultFromJson(String str) =>
    CompanySubscriptionResult.fromJson(json.decode(str));

String companySubscriptionResultToJson(CompanySubscriptionResult data) => json.encode(data.toJson());

class CompanySubscriptionResult {
  CompanySubscriptionData? result;
  int? status;
  int? statuscode;
  List<String>? message;
  String? exception;

  CompanySubscriptionResult({
    this.result,
    this.status,
    this.statuscode,
    this.message,
    this.exception,
  });

  factory CompanySubscriptionResult.fromJson(Map<String, dynamic> json) => CompanySubscriptionResult(
        result:json["result"]==null? null: CompanySubscriptionData.fromJson(json["result"]),
        status: json["status"],
        statuscode: json["statuscode"],
        message: List<String>.from(json["message"].map((x) => x)),
        exception: json["exception"],
      );

  Map<String, dynamic> toJson() => {
        "result": result?.toJson(),
        "status": status,
        "statuscode": statuscode,
        "message": List<dynamic>.from(message!.map((x) => x)),
        "exception": exception,
      };
}

class CompanySubscriptionData {
  late int companyId;
  late int subscriptionPlanId;
  String? subscriptionTypeName;
  String? planName;
  late int planDuration;
  late num price;
  late List<PlanFeature> planFeatures = [];
  late List<SubscriptionPayment> subscriptionPayment = [];

  CompanySubscriptionData({
    required this.companyId,
    required this.subscriptionPlanId,
    this.subscriptionTypeName,
    this.planName,
    required this.planDuration,
    required this.price,
    required this.planFeatures,
    required this.subscriptionPayment,
  });

  factory CompanySubscriptionData.fromJson(Map<String, dynamic> json) => CompanySubscriptionData(
        companyId: json["companyId"],
        subscriptionPlanId: json["subscriptionPlanId"],
        subscriptionTypeName: json["subscriptionTypeName"],
        planName: json["planName"],
        planDuration: json["planDuration"],
        price: json["price"],
        planFeatures: List<PlanFeature>.from(json["planFeatures"].map((x) => PlanFeature.fromJson(x))),
        subscriptionPayment:
            List<SubscriptionPayment>.from(json["subscriptionPayment"].map((x) => SubscriptionPayment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "companyId": companyId,
        "subscriptionPlanId": subscriptionPlanId,
        "subscriptionTypeName": subscriptionTypeName,
        "planName": planName,
        "planDuration": planDuration,
        "price": price,
        "planFeatures": List<dynamic>.from(planFeatures.map((x) => x.toJson())),
        "subscriptionPayment": List<dynamic>.from(subscriptionPayment.map((x) => x.toJson())),
      };
}

class PlanFeature {
  late int id;
  late int planId;
  late int featureId;
  String? name;
  late bool active;

  PlanFeature({
    required this.id,
    required this.planId,
    required this.featureId,
    this.name,
    required this.active,
  });

  factory PlanFeature.fromJson(Map<String, dynamic> json) => PlanFeature(
        id: json["id"],
        planId: json["planId"],
        featureId: json["featureId"],
        name: json["name"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "planId": planId,
        "featureId": featureId,
        "name": name,
        "active": active,
      };
}

class SubscriptionPayment {
  late int id;
  String? subscriptionTypeName;
  String? planName;
  late int planDuration;
  String? invoiceNo;
  num amount;
  String? currency;
  String? paymentMethod;
  DateTime date;
  String? paidBy;
  bool status;

  SubscriptionPayment({
    required this.id,
    required this.subscriptionTypeName,
    this.planName,
    required this.planDuration,
    this.invoiceNo,
    required this.amount,
    this.currency,
    this.paymentMethod,
    required this.date,
    this.paidBy,
    required this.status,
  });

  factory SubscriptionPayment.fromJson(Map<String, dynamic> json) => SubscriptionPayment(
        id: json["id"],
        subscriptionTypeName: json["subscriptionTypeName"],
        planName: json["planName"],
        planDuration: json["planDuration"],
        invoiceNo: json["invoiceNo"],
        amount: json["amount"],
        currency: json["currency"],
        paymentMethod: json["paymentMethod"],
        date: DateTime.parse(json["date"]),
        paidBy: json["paidBy"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subscriptionTypeName": subscriptionTypeName,
        "planName": planName,
        "planDuration": planDuration,
        "invoiceNo": invoiceNo,
        "amount": amount,
        "currency": currency,
        "paymentMethod": paymentMethod,
        "date": date.toIso8601String(),
        "paidBy": paidBy,
        "status": status,
      };
}
