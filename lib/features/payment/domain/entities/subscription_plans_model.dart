// To parse this JSON data, do
//
//     final subscriptionPlanModelListGenericResponseResult = subscriptionPlanModelListGenericResponseResultFromJson(jsonString);

import 'dart:convert';

SubscriptionPlanModelListGenericResponseResult subscriptionPlanModelListGenericResponseResultFromJson(String str) => SubscriptionPlanModelListGenericResponseResult.fromJson(json.decode(str));

String subscriptionPlanModelListGenericResponseResultToJson(SubscriptionPlanModelListGenericResponseResult data) => json.encode(data.toJson());

class SubscriptionPlanModelListGenericResponseResult {
  List<SubscriptionPlanModel>? result;
  int? status;
  int? statuscode;
  List<String>? message;
  dynamic exception;

  SubscriptionPlanModelListGenericResponseResult({
    required this.result,
    required this.status,
    required this.statuscode,
    required this.message,
    this.exception,
  });

  factory SubscriptionPlanModelListGenericResponseResult.fromJson(Map<String, dynamic> json) => SubscriptionPlanModelListGenericResponseResult(
    result: List<SubscriptionPlanModel>.from(json["result"].map((x) => SubscriptionPlanModel.fromJson(x))),
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

class SubscriptionPlanModel {
  int id;
  int subscriptionTypeId;
  String? subscriptionTypeName;
  String? name;
  int planPeriod;
  int price;
  String? comment;
  int freePeriod;
  bool? active;
  List<PlanFeature> planFeatures;

  SubscriptionPlanModel({
    required this.id,
    required this.subscriptionTypeId,
    required this.subscriptionTypeName,
    required this.name,
    required this.planPeriod,
    required this.price,
    required this.comment,
    required this.freePeriod,
    required this.active,
    required this.planFeatures,
  });

  factory SubscriptionPlanModel.fromJson(Map<String, dynamic> json) => SubscriptionPlanModel(
    id: json["id"],
    subscriptionTypeId: json["subscriptionTypeId"],
    subscriptionTypeName: json["subscriptionTypeName"],
    name: json["name"],
    planPeriod: json["planPeriod"],
    price: json["price"],
    comment: json["comment"],
    freePeriod: json["freePeriod"],
    active: json["active"],
    planFeatures: List<PlanFeature>.from(json["planFeatures"].map((x) => PlanFeature.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "subscriptionTypeId": subscriptionTypeId,
    "subscriptionTypeName": subscriptionTypeName,
    "name": name,
    "planPeriod": planPeriod,
    "price": price,
    "comment": comment,
    "freePeriod": freePeriod,
    "active": active,
    "planFeatures": List<dynamic>.from(planFeatures.map((x) => x.toJson())),
  };
}

class PlanFeature {
  int id;
  int planId;
  int featureId;
  String name;
  bool active;

  PlanFeature({
    required this.id,
    required this.planId,
    required this.featureId,
    required this.name,
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
