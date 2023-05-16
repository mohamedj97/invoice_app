import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../domain/entities/company_branch.dart';

part 'get_branches_response_model.g.dart';

@JsonSerializable()
class GetBranchesResponseModel extends CompanyBranch {
  GetBranchesResponseModel({
    required super.id,
    required super.companyId,
    required super.code,
    required super.name,
    super.address,
    super.address2,
    required super.active,
  });

  factory GetBranchesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetBranchesResponseDataModelFromJson(json);
}

@JsonSerializable()
class GetBranchesResponse extends BaseAPIResponse {
  late GetBranchesResponseModel? result;

  GetBranchesResponse({
    required super.statuscode,
    super.message,
    required this.result,
  });

  factory GetBranchesResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetBranchesResponseFromJson(json!);
}
