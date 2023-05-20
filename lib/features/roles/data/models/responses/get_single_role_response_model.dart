import 'package:invoice_app/features/roles/domain/entities/get_single_role_result.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../domain/entities/role.dart';

part 'get_single_role_response_model.g.dart';

@JsonSerializable()
class GetSingleRoleResponseModel extends GetSingleRoleResult {
  GetSingleRoleResponseModel({
    required super.role,
  });

  factory GetSingleRoleResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetSingleRoleResponseModelFromJson(json);
}

@JsonSerializable()
class GetSingleRoleResponse extends BaseAPIResponse {
  late GetSingleRoleResponseModel? result;

  GetSingleRoleResponse({
    required super.statuscode,
    super.message,
    required this.result,
  });

  factory GetSingleRoleResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetSingleRoleResponseFromJson(json!);
}
