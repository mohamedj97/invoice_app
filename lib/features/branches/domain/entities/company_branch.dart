import 'dart:convert';

CompanyBranch companyBranchFromJson(String str) => CompanyBranch.fromJson(json.decode(str));

String companyBranchToJson(CompanyBranch data) => json.encode(data.toJson());

class CompanyBranch {
  late int id;
  late int companyId;
  late String code;
  late String name;
  String? address;
  String? address2;
  late bool active;

  CompanyBranch({
    required this.id,
    required this.companyId,
    required this.code,
    required this.name,
    this.address,
    this.address2,
    required this.active,
  });

  factory CompanyBranch.fromJson(Map<String, dynamic> json) => CompanyBranch(
        id: json["id"],
        companyId: json["companyId"],
        code: json["code"],
        name: json["name"],
        address: json["address"],
        address2: json["address2"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "companyId": companyId,
        "code": code,
        "name": name,
        "address": address,
        "address2": address2,
        "active": active,
      };
}
