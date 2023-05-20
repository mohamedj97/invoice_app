class UserRequest {
  late int id;
  String? username;
  String? fullname;
  String? password;
  String? email;
  late int companyId;
  late int branchId;
  late int roleId;
  late bool active;

  UserRequest({
    required this.id,
    this.username,
    this.fullname,
    this.password,
    this.email,
    required this.companyId,
    required this.branchId,
    required this.roleId,
    required this.active,
  });

  factory UserRequest.fromJson(Map<String, dynamic> json) => UserRequest(
        id: json["id"],
        username: json["username"],
        fullname: json["fullname"],
        password: json["password"],
        email: json["email"],
        companyId: json["companyID"],
        branchId: json["branchID"],
        roleId: json["roleID"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "fullname": fullname,
        "password": password,
        "email": email,
        "companyID": companyId,
        "branchID": branchId,
        "roleID": roleId,
        "active": active,
      };
}
