import 'package:json_annotation/json_annotation.dart';
part 'company_branch.g.dart';

@JsonSerializable()
class CompanyBranch {
  late int id;
  late int companyid;
  late String code;
  late String name;
  String? address;
  String? address2;
  late bool active;

  CompanyBranch({
   required this.id,
   required this.companyid,
   required this.code,
   required this.name,
    this.address,
    this.address2,
    required this.active,
  });

  factory CompanyBranch.fromJson(Map<String, dynamic> json) =>
      _$CompanyBranchFromJson(json);
}
