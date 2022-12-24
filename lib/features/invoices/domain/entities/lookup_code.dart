import 'package:json_annotation/json_annotation.dart';
part 'lookup_code.g.dart';
@JsonSerializable()
class LookupCode {
  LookupCode({
    this.code,
    required this.id,
    this.name,

  });

  String? code;
  int id;
  String? name;

  factory LookupCode.fromJson(Map<String, dynamic> json) =>
      _$LookupCodeFromJson(json);
}
