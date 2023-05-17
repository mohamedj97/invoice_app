import 'package:invoice_app/features/branches/domain/entities/company_branch.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';

part 'add_branch_response_model.g.dart';

@JsonSerializable()
class AddBranchResponseDataModel extends CompanyBranch {
  AddBranchResponseDataModel({
    required super.id,
    required super.companyId,
    super.code,
    super.name,
    super.address,
    super.address2,
    required super.active,
  });

  factory AddBranchResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$AddBranchResponseDataModelFromJson(json);
}


@JsonSerializable()
class AddBranchResponse extends BaseAPIResponse {
  late AddBranchResponseDataModel? result;

  AddBranchResponse({
    required super.statuscode,
    super.message,
    required this.result,
  });

  factory AddBranchResponse.fromJson(Map<String, dynamic>? json) =>
      _$AddBranchResponseFromJson(json!);
}
