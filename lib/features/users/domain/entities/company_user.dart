class CompanyUser {
  late int userid;
  String? username;
  String? fullname;
  String? email;
  bool? active;
  int? companyid;
  String? companycode;
  String? companyname;
  int? branchid;
  String? branchcode;
  String? branchname;
  String? password;
  String? loginId;
  int? roleId;
  String? roleName;
  String? roleDescription;
  bool? roleStatus;

  CompanyUser({
    required this.userid,
     this.username,
     this.fullname,
     this.email,
     this.active,
     this.companyid,
     this.companycode,
     this.companyname,
     this.branchid,
     this.branchcode,
     this.branchname,
     this.password,
     this.loginId,
     this.roleId,
     this.roleName,
     this.roleDescription,
     this.roleStatus,
  });

  factory CompanyUser.fromJson(Map<String, dynamic> json) => CompanyUser(
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