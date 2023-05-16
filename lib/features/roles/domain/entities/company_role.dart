import 'dart:convert';

CompanyRole companyRoleFromJson(String str) => CompanyRole.fromJson(json.decode(str));

String companyRoleToJson(CompanyRole data) => json.encode(data.toJson());

class CompanyRole {
  late int id;
  late int companyId;
  String? roleName;
  String? roleDescription;
  bool? canEdit;
  bool? canView;
  bool? active;

  CompanyRole({
    required this.id,
    required this.companyId,
     this.roleName,
     this.roleDescription,
     this.canEdit,
     this.canView,
     this.active,
  });

  factory CompanyRole.fromJson(Map<String, dynamic> json) => CompanyRole(
    id: json["id"],
    companyId: json["companyId"],
    roleName: json["roleName"],
    roleDescription: json["roleDescription"],
    canEdit: json["canEdit"],
    canView: json["canView"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "companyId": companyId,
    "roleName": roleName,
    "roleDescription": roleDescription,
    "canEdit": canEdit,
    "canView": canView,
    "active": active,
  };
}