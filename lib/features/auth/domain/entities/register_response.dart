import 'package:equatable/equatable.dart';

class RegisterResponseData extends Equatable {
  late int securityCodeValideTime;
  late int userId;
  late String email;
  String? token;
  String? loginId;
  late bool active;
  late int selcompany;

  RegisterResponseData({
    this.token,
    this.loginId,
    required this.securityCodeValideTime,
    required this.userId,
    required this.email,
    required this.selcompany,
    required this.active,
  });

  @override
  List<Object?> get props {
    return [
      token,
      loginId,
      securityCodeValideTime,
      userId,
      email,
      selcompany,
      active,
    ];
  }
}
