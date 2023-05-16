import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../domain/entities/company_branch.dart';
import '../../../domain/entities/get_branches_result.dart';

part 'get_branches_response_model.g.dart';

@JsonSerializable()
class GetBranchesResponseModel extends GetBranchesResult {
  GetBranchesResponseModel({
    required super.branches,
  });

  factory GetBranchesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetBranchesResponseModelFromJson(json);
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
