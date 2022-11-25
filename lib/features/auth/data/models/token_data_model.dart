import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/token_data.dart';

part 'token_data_model.g.dart';

@JsonSerializable()
class TokenDataModel extends TokenData {
  const TokenDataModel({
    required super.token,
    required super.expiration,
  });

  factory TokenDataModel.fromJson(Map<String, dynamic> json) =>
      _$TokenDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDataModelToJson(this);
}
