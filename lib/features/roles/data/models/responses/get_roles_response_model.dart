import 'package:invoice_app/features/roles/domain/entities/get_roles_result.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../domain/entities/company_role.dart';

part 'get_roles_response_model.g.dart';

@JsonSerializable()
class GetRolesResponseModel extends GetRolesResult {
  GetRolesResponseModel({
    required super.roles,
  });

  factory GetRolesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetRolesResponseModelFromJson(json);
}

@JsonSerializable()
class GetRolesResponse extends BaseAPIResponse {
  late GetRolesResponseModel? result;

  GetRolesResponse({
    required super.statuscode,
    super.message,
    required this.result,
  });

  factory GetRolesResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetRolesResponseFromJson(json!);
}
