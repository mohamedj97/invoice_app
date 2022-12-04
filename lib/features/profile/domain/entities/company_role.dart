import 'package:json_annotation/json_annotation.dart';
part 'company_role.g.dart';

@JsonSerializable()
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
    this.active,
    this.canView,
  });

  factory CompanyRole.fromJson(Map<String, dynamic> json) =>
      _$CompanyRoleFromJson(json);
}