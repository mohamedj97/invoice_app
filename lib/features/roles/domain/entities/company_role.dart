import 'dart:convert';

CompanyRole companyRoleFromJson(String str) => CompanyRole.fromJson(json.decode(str));

String companyRoleToJson(CompanyRole data) => json.encode(data.toJson());

class CompanyRole {
  late int companyid;
  late int id;
  String? name;
  String? description;
  late int noOfUsers;

  CompanyRole({
    required this.companyid,
    required this.id,
    this.name,
    this.description,
    required this.noOfUsers,
  });

  factory CompanyRole.fromJson(Map<String, dynamic> json) => CompanyRole(
    companyid: json["companyid"],
    id: json["id"],
    name: json["name"],
    description: json["description"],
    noOfUsers: json["noOfUsers"],
  );

  Map<String, dynamic> toJson() => {
    "companyid": companyid,
    "id": id,
    "name": name,
    "description": description,
    "noOfUsers": noOfUsers,
  };
}
