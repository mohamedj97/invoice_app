import 'package:equatable/equatable.dart';


class LoginResponseData extends Equatable {

  late String token;

  late DateTime expiration;


  LoginResponseData({
    required this.token,
    required this.expiration,
  });

  @override
  List<Object> get props {
    return [
      token,
      expiration,
    ];
  }
}
