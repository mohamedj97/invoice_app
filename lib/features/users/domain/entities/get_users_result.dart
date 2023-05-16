import 'package:json_annotation/json_annotation.dart';

import 'company_user.dart';

part 'get_users_result.g.dart';

@JsonSerializable()
class GetUsersResult {
  late List<CompanyUser> users = [];

  GetUsersResult({
    required this.users,
  });

  factory GetUsersResult.fromJson(Map<String, dynamic> json) =>
      _$GetUsersResultFromJson(json);
}
