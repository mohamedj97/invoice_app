import 'package:invoice_app/features/profile/domain/entities/company_branch.dart';
import 'package:invoice_app/features/profile/domain/entities/company_role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_company_branch.g.dart';

@JsonSerializable()
class UserCompanyBranch {
  late CompanyBranch branch;
  late List<CompanyRole> roles;

  UserCompanyBranch({
   required this.branch,
   required this.roles,
  });

  factory UserCompanyBranch.fromJson(Map<String, dynamic> json) =>
      _$UserCompanyBranchFromJson(json);
}
