import 'package:invoice_app/features/auth/domain/entities/register_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable()
class RegisterModel extends RegisterRequest {
  RegisterModel({required super.Username, required super.Password, required super.ConfirmedPassword, required super.Email});

  @override
  String toString() {
    return 'RegisterModel[Username=$Username, Password=$Password, ConfirmedPassword=$ConfirmedPassword, Email=$Email, ]';
  }

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
