import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/login_request.dart';
part 'login_request_model.g.dart';

@JsonSerializable()
class LoginModel extends LoginRequest {
  LoginModel(super.username, super.password);

  @override
  String toString() {
    return 'LoginModel[Username=$username, Password=$password, ]';
  }

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
