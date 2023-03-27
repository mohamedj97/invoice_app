import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../domain/entities/validate_code_response.dart';

part 'validate_code_response_model.g.dart';

@JsonSerializable()
class ValidateCodeResponseDataModel extends ValidateCodeResponseData {
  ValidateCodeResponseDataModel({
    required super.Email,
    required super.Username,
  });

  factory ValidateCodeResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$ValidateCodeResponseDataModelFromJson(json);
}

@JsonSerializable()
class ValidateCodeResponse extends BaseAPIResponse {
  late ValidateCodeResponse? result;

  ValidateCodeResponse({
    required super.statuscode,
    super.message,
    required this.result,
  });

  factory ValidateCodeResponse.fromJson(Map<String, dynamic>? json) =>
      _$ValidateCodeResponseFromJson(json!);
}
