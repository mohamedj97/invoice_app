import 'package:equatable/equatable.dart';

class RegisterRequest extends Equatable {
  String Username;

  String Password;
  String ConfirmedPassword;
  String Email;

  RegisterRequest({required this.Username, required this.Password, required this.ConfirmedPassword, required this.Email});

  @override
  List<Object> get props => [Username, Password, ConfirmedPassword, Email];
}
