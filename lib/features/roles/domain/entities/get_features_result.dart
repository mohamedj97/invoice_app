import 'package:invoice_app/features/roles/domain/entities/role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_features_result.g.dart';

@JsonSerializable()
class GetFeaturesResult {
  late List<Feature> result = [];

  GetFeaturesResult({
    required this.result,
  });

  factory GetFeaturesResult.fromJson(Map<String, dynamic> json) =>
      _$GetFeaturesResultFromJson(json);
}
