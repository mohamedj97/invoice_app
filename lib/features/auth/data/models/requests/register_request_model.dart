import 'package:invoice_app/features/auth/domain/entities/register_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable()
class RegisterModel extends RegisterRequest {
  RegisterModel({required super.username, required super.password, required super.confirmPassword, required super.email});

  @override
  String toString() {
    return 'RegisterModel[Username=$username, Password=$password, ConfirmedPassword=$confirmPassword, Email=$email, ]';
  }

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
