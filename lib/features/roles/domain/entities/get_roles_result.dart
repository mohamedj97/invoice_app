import 'package:json_annotation/json_annotation.dart';
import 'company_role.dart';

part 'get_roles_result.g.dart';

@JsonSerializable()
class GetRolesResult {
  late List<CompanyRole> roles = [];

  GetRolesResult({
    required this.roles,
  });

  factory GetRolesResult.fromJson(Map<String, dynamic> json) =>
      _$GetRolesResultFromJson(json);
}
