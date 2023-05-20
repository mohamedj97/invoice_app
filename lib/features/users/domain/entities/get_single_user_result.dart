import 'package:json_annotation/json_annotation.dart';
import 'company_user.dart';

part 'get_single_user_result.g.dart';

@JsonSerializable()
class GetSingleUserResult {
  late CompanyUser user;

  GetSingleUserResult({
    required this.user,
  });

  factory GetSingleUserResult.fromJson(Map<String, dynamic> json) =>
      _$GetSingleUserResultFromJson(json);
}
