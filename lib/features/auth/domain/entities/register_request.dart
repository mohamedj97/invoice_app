import 'package:equatable/equatable.dart';

class RegisterRequest extends Equatable {
  String username;

  String password;
  String confirmPassword;
  String email;

  RegisterRequest({required this.username, required this.password, required this.confirmPassword, required this.email});

  @override
  List<Object> get props => [username, password, confirmPassword, email];
}
