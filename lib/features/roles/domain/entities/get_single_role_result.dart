import 'package:invoice_app/features/roles/domain/entities/role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_single_role_result.g.dart';

@JsonSerializable()
class GetSingleRoleResult {
  late Role role;

  GetSingleRoleResult({
    required this.role,
  });

  factory GetSingleRoleResult.fromJson(Map<String, dynamic> json) =>
      _$GetSingleRoleResultFromJson(json);
}
