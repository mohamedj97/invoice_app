class CompanyUser {
  int id;
  int companyId;
  int userId;
  int branchId;
  int roleId;
  bool active;

  CompanyUser({
    required this.id,
    required this.companyId,
    required this.userId,
    required this.branchId,
    required this.roleId,
    required this.active,
  });

  factory CompanyUser.fromJson(Map<String, dynamic> json) => CompanyUser(
    id: json["id"],
    companyId: json["companyId"],
    userId: json["userId"],
    branchId: json["branchId"],
    roleId: json["roleId"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "companyId": companyId,
    "userId": userId,
    "branchId": branchId,
    "roleId": roleId,
    "active": active,
  };
}