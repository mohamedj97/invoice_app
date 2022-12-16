import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../domain/entities/get_item_types_result_response.dart';
import '../../../domain/entities/item_lookup_result.dart';
import '../../../domain/entities/meta.dart';

part 'get_item_types_response_model.g.dart';

@JsonSerializable()
class GetItemTypesResponseDataModel extends ItemTypesResultResponse {
  GetItemTypesResponseDataModel({
    required super.result,
    required super.meta,
    super.total,
  });

  factory GetItemTypesResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetItemTypesResponseDataModelFromJson(json);
}

@JsonSerializable()
class GetItemTypesResponse extends BaseAPIResponse {
  late GetItemTypesResponseDataModel? result;

  GetItemTypesResponse({
    required super.statuscode,
    super.message,
    required this.result,
  });

  factory GetItemTypesResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetItemTypesResponseFromJson(json!);
}
