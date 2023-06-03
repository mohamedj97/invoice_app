// To parse this JSON data, do
//
//     final addUserResult = addUserResultFromJson(jsonString);

import 'dart:convert';

AddUserResult addUserResultFromJson(String str) => AddUserResult.fromJson(json.decode(str));

String addUserResultToJson(AddUserResult data) => json.encode(data.toJson());

class AddUserResult {
  Result? result;
  int? status;
  int? statuscode;
  List<String>? message;
  String? exception;

  AddUserResult({
     this.result,
     this.status,
     this.statuscode,
     this.message,
     this.exception,
  });

  factory AddUserResult.fromJson(Map<String, dynamic> json) => AddUserResult(
    result: Result?.fromJson(json["result"]),
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
  int userid;
  String username;
  String fullname;
  String email;
  bool active;
  int companyid;
  String companycode;
  String companyname;
  int branchid;
  String branchcode;
  String branchname;
  String password;
  String loginId;
  int roleId;
  String roleName;
  String roleDescription;
  bool roleStatus;

  Result({
    required this.userid,
    required this.username,
    required this.fullname,
    required this.email,
    required this.active,
    required this.companyid,
    required this.companycode,
    required this.companyname,
    required this.branchid,
    required this.branchcode,
    required this.branchname,
    required this.password,
    required this.loginId,
    required this.roleId,
    required this.roleName,
    required this.roleDescription,
    required this.roleStatus,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    userid: json["userid"],
    username: json["username"],
    fullname: json["fullname"],
    email: json["email"],
    active: json["active"],
    companyid: json["companyid"],
    companycode: json["companycode"],
    companyname: json["companyname"],
    branchid: json["branchid"],
    branchcode: json["branchcode"],
    branchname: json["branchname"],
    password: json["password"],
    loginId: json["loginId"],
    roleId: json["roleId"],
    roleName: json["roleName"],
    roleDescription: json["roleDescription"],
    roleStatus: json["roleStatus"],
  );

  Map<String, dynamic> toJson() => {
    "userid": userid,
    "username": username,
    "fullname": fullname,
    "email": email,
    "active": active,
    "companyid": companyid,
    "companycode": companycode,
    "companyname": companyname,
    "branchid": branchid,
    "branchcode": branchcode,
    "branchname": branchname,
    "password": password,
    "loginId": loginId,
    "roleId": roleId,
    "roleName": roleName,
    "roleDescription": roleDescription,
    "roleStatus": roleStatus,
  };
}
