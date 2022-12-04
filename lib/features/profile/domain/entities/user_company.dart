import 'package:invoice_app/features/profile/domain/entities/user_company_branch.dart';
import 'package:json_annotation/json_annotation.dart';

import 'company_info.dart';
part 'user_company.g.dart';

@JsonSerializable()
class UserCompany {
  late CompanyInfo companyInfo;
  late List<UserCompanyBranch> branches=[];

  UserCompany({
    required this.companyInfo,
    required this.branches,
  });

  factory UserCompany.fromJson(Map<String, dynamic> json) =>
      _$UserCompanyFromJson(json);
}