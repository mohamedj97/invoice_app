// To parse this JSON data, do
//
//     final getFeaturesResult = getFeaturesResultFromJson(jsonString);

import 'dart:convert';

GetFeaturesResult getFeaturesResultFromJson(String str) => GetFeaturesResult.fromJson(json.decode(str));

String getFeaturesResultToJson(GetFeaturesResult data) => json.encode(data.toJson());

class GetFeaturesResult {
  List<FeatureModel>? result;
  int? status;
  int? statuscode;
  List<String>? message;
  String? exception;

  GetFeaturesResult({
    required this.result,
    required this.status,
    required this.statuscode,
    required this.message,
    required this.exception,
  });

  factory GetFeaturesResult.fromJson(Map<String, dynamic> json) => GetFeaturesResult(
    result: List<FeatureModel>.from(json["result"].map((x) => FeatureModel.fromJson(x))),
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

class FeatureModel {
  int id;
  int code;
  String name;
  String? description;
  String? descriptionAr;
  int? parentCode;
  int? level;
  int? index;
  bool status;

  FeatureModel({
    required this.id,
    required this.code,
    required this.name,
    this.description,
    this.descriptionAr,
    this.parentCode,
    this.level,
    this.index,
    required this.status,
  });

  factory FeatureModel.fromJson(Map<String, dynamic> json) => FeatureModel(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    description: json["description"],
    descriptionAr: json["descriptionAr"],
    parentCode: json["parentCode"],
    level: json["level"],
    index: json["index"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "description": description,
    "descriptionAr": descriptionAr,
    "parentCode": parentCode,
    "level": level,
    "index": index,
    "status": status,
  };
}
