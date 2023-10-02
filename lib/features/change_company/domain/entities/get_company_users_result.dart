// To parse this JSON data, do
//
//     final getUsersCompaniesResult = getUsersCompaniesResultFromJson(jsonString);

import 'dart:convert';

GetUsersCompaniesResult getUsersCompaniesResultFromJson(String str) => GetUsersCompaniesResult.fromJson(json.decode(str));

String getUsersCompaniesResultToJson(GetUsersCompaniesResult data) => json.encode(data.toJson());

class GetUsersCompaniesResult {
  List<CompanyInfo>? companies;
  int status;
  int statuscode;
  List<String>? message;
  String? exception;

  GetUsersCompaniesResult({
     this.companies,
    required this.status,
    required this.statuscode,
     this.message,
     this.exception,
  });

  factory GetUsersCompaniesResult.fromJson(Map<String, dynamic> json) => GetUsersCompaniesResult(
    companies: List<CompanyInfo>.from(json["result"].map((x) => CompanyInfo.fromJson(x))),
    status: json["status"],
    statuscode: json["statuscode"],
    message: List<String>.from(json["message"].map((x) => x)),
    exception: json["exception"],
  );

  Map<String, dynamic> toJson() => {
    "result": companies==null?[]:List<dynamic>.from(companies!.map((x) => x.toJson())),
    "status": status,
    "statuscode": statuscode,
    "message": message==null?[]:List<dynamic>.from(message!.map((x) => x)),
    "exception": exception,
  };
}

class CompanyInfo {
 late int companyId;
  String? code;
  String? name;
  String? logoUrl;
 late bool selected;

  CompanyInfo({
    required this.companyId,
     this.code,
     this.name,
     this.logoUrl,
    required this.selected,
  });

  factory CompanyInfo.fromJson(Map<String, dynamic> json) => CompanyInfo(
    companyId: json["companyId"],
    code: json["code"],
    name: json["name"],
    logoUrl: json["logoURL"],
    selected: json["selected"],
  );

  Map<String, dynamic> toJson() => {
    "companyId": companyId,
    "code": code,
    "name": name,
    "logoURL": logoUrl,
    "selected": selected,
  };
}
