import 'package:invoice_app/features/profile/domain/entities/change_password_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_password_request_model.g.dart';

@JsonSerializable()
class ChangePasswordModel extends ChangePasswordRequest {
  ChangePasswordModel(
    super.Username,
    super.CurrentPassword,
    super.NewPassword,
    super.ConfirmNewPassword,
  );

  @override
  String toString() {
    return 'ChangePasswordModel[Username=$Username, CurrentPassword=$CurrentPassword, NewPassword=$NewPassword, ConfirmNewPassword=$ConfirmNewPassword, ]';
  }

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordModelToJson(this);
}
