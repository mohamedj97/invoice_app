import 'package:invoice_app/features/branches/domain/entities/company_branch.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../roles/domain/entities/company_role.dart';

part 'get_user_lookup_result.g.dart';

@JsonSerializable()
class GetUserLookupResult {
  late List<CompanyBranch> companybranchs=[];
  late List<CompanyRole> userRoles=[];

  GetUserLookupResult({
    required this.companybranchs,
    required this.userRoles,
  });

  factory GetUserLookupResult.fromJson(Map<String, dynamic> json) =>
      _$GetUserLookupResultFromJson(json);
}
