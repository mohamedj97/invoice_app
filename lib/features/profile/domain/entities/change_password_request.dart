import 'package:equatable/equatable.dart';

class ChangePasswordRequest extends Equatable{
  String Username;
  String CurrentPassword;
  String NewPassword;
  String ConfirmNewPassword;

  ChangePasswordRequest(this.Username, this.CurrentPassword,this.NewPassword,this.ConfirmNewPassword);
  @override
  List<Object> get props => [Username, CurrentPassword,NewPassword,ConfirmNewPassword];

}