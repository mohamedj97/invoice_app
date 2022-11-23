import 'package:equatable/equatable.dart';

class LoginRequest extends Equatable {
  String username;

  String password;

  LoginRequest(this.username, this.password);
  @override
  List<Object> get props => [username, password];
}
