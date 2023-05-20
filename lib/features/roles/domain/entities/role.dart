class Role {
  late List<Feature> features = [];
  late List<CompanyRoleFeature> companyRoleFeatures = [];
  late int id;
  late int companyId;
  String? roleName;
  String? roleDescription;
  bool? canEdit;
  bool? canView;
  bool? active;

  Role({
    required this.features,
    required this.companyRoleFeatures,
    required this.id,
    required this.companyId,
    this.roleName,
    this.roleDescription,
    this.canEdit,
    this.canView,
    this.active,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
        companyRoleFeatures:
            List<CompanyRoleFeature>.from(json["companyRoleFeatures"].map((x) => CompanyRoleFeature.fromJson(x))),
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

class CompanyRoleFeature {
  late int id;
  late int companyRoleId;
  late int featureId;
  bool? status;

  CompanyRoleFeature({
    required this.id,
    required this.companyRoleId,
    required this.featureId,
    this.status,
  });

  factory CompanyRoleFeature.fromJson(Map<String, dynamic> json) => CompanyRoleFeature(
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

class Feature {
  late int id;
  late int code;
  late String name;
  String? description;
  String? descriptionAr;
  int? parentCode;
  int? level;
  int? index;
  late bool status;

  Feature({
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

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
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
