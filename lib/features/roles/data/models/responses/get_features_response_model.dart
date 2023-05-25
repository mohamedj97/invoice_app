import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../domain/entities/get_features_result.dart';
import '../../../domain/entities/role.dart';

part 'get_features_response_model.g.dart';

@JsonSerializable()
class GetFeaturesResponseModel extends GetFeaturesResult {
  GetFeaturesResponseModel({
    required super.result,
  });

  factory GetFeaturesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetFeaturesResponseModelFromJson(json);
}

@JsonSerializable()
class GetFeaturesResponse extends BaseAPIResponse {
  late GetFeaturesResponseModel? result;

  GetFeaturesResponse({
    required super.statuscode,
    super.message,
    required this.result,
  });

  factory GetFeaturesResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetFeaturesResponseFromJson(json!);
}
