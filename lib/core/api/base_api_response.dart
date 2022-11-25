import 'package:json_annotation/json_annotation.dart';
part 'base_api_response.g.dart';

@JsonSerializable()
class BaseAPIResponse {
  String? errorMessage;
  late int? statusCode;

  BaseAPIResponse(
      {this.errorMessage, this.statusCode});

  factory BaseAPIResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseAPIResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseAPIResponseToJson(this);
}

@JsonSerializable()
class BoolResponse extends BaseAPIResponse {
  final bool result;

  BoolResponse({
    required this.result,
    super.errorMessage,
    super.statusCode
  });

  factory BoolResponse.fromJson(Map<String, dynamic> json) =>
      _$BoolResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BoolResponseToJson(this);
}

@JsonSerializable()
class StringResponse extends BaseAPIResponse {
  final String result;

  StringResponse({
    required this.result,
    required super.statusCode,
    super.errorMessage,
  });

  factory StringResponse.fromJson(Map<String, dynamic> json) =>
      _$StringResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StringResponseToJson(this);
}

@JsonSerializable()
class StringsListResponse extends BaseAPIResponse {
  final List<String> result;

  StringsListResponse({
    required this.result,
    required super.statusCode,
    super.errorMessage,
  });

  factory StringsListResponse.fromJson(Map<String, dynamic> json) =>
      _$StringsListResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StringsListResponseToJson(this);
}

@JsonSerializable()
class IntResponse extends BaseAPIResponse {
  final int result;

  IntResponse({
    required this.result,
    required super.statusCode,
    super.errorMessage,
  });

  factory IntResponse.fromJson(Map<String, dynamic> json) =>
      _$IntResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$IntResponseToJson(this);
}
