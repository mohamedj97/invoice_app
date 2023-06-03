// To parse this JSON data, do
//
//     final getsingleRoleResult = getsingleRoleResultFromJson(jsonString);

import 'dart:convert';

GetSingleRoleResult getsingleRoleResultFromJson(String str) => GetSingleRoleResult.fromJson(json.decode(str));

String getsingleRoleResultToJson(GetSingleRoleResult data) => json.encode(data.toJson());

class GetSingleRoleResult {
  Result? result;
  int? status;
  int? statuscode;
  List<String>? message;
  String? exception;

  GetSingleRoleResult({
     this.result,
     this.status,
     this.statuscode,
     this.message,
     this.exception,
  });

  factory GetSingleRoleResult.fromJson(Map<String, dynamic> json) => GetSingleRoleResult(
    result: Result.fromJson(json["result"]),
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

class Result {
  List<FeatureSingle> features;
  List<CompanyRoleFeatures> companyRoleFeatures;
  int id;
  int companyId;
  String roleName;
  String roleDescription;
  bool canEdit;
  bool canView;
  bool active;

  Result({
    required this.features,
    required this.companyRoleFeatures,
    required this.id,
    required this.companyId,
    required this.roleName,
    required this.roleDescription,
    required this.canEdit,
    required this.canView,
    required this.active,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    features: List<FeatureSingle>.from(json["features"].map((x) => FeatureSingle.fromJson(x))),
    companyRoleFeatures: List<CompanyRoleFeatures>.from(json["companyRoleFeatures"].map((x) => CompanyRoleFeatures.fromJson(x))),
    id: json["id"],
    companyId: json["companyId"],
    roleName: json["roleName"],
    roleDescription: json["roleDescription"],
    canEdit: json["canEdit"],
    canView: json["canView"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "features": List<dynamic>.from(features.map((x) => x.toJson())),
    "companyRoleFeatures": List<dynamic>.from(companyRoleFeatures.map((x) => x.toJson())),
    "id": id,
    "companyId": companyId,
    "roleName": roleName,
    "roleDescription": roleDescription,
    "canEdit": canEdit,
    "canView": canView,
    "active": active,
  };
}

class CompanyRoleFeatures {
  int id;
  int companyRoleId;
  int featureId;
  bool status;

  CompanyRoleFeatures({
    required this.id,
    required this.companyRoleId,
    required this.featureId,
    required this.status,
  });

  factory CompanyRoleFeatures.fromJson(Map<String, dynamic> json) => CompanyRoleFeatures(
    id: json["id"],
    companyRoleId: json["companyRoleId"],
    featureId: json["featureId"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "companyRoleId": companyRoleId,
    "featureId": featureId,
    "status": status,
  };
}

class FeatureSingle {
  int id;
  int code;
  String name;
  String description;
  String descriptionAr;
  int parentCode;
  int level;
  int index;
  bool status;

  FeatureSingle({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.descriptionAr,
    required this.parentCode,
    required this.level,
    required this.index,
    required this.status,
  });

  factory FeatureSingle.fromJson(Map<String, dynamic> json) => FeatureSingle(
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
