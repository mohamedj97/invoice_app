import 'package:invoice_app/features/branches/domain/entities/company_branch.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_branches_result.g.dart';

@JsonSerializable()
class GetBranchesResult {
  late List<CompanyBranch> branches = [];

  GetBranchesResult({
    required this.branches,
  });

  factory GetBranchesResult.fromJson(Map<String, dynamic> json) =>
      _$GetBranchesResultFromJson(json);
}
