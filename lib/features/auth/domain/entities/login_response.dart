import 'package:equatable/equatable.dart';


class LoginResponseData extends Equatable {

  late String token;

  late DateTime expiration;

  late String loginId;

  LoginResponseData({
    required this.token,
    required this.expiration,
    required this.loginId,
  });

  @override
  List<Object> get props {
    return [
      token,
      expiration,
      loginId,
    ];
  }
}
