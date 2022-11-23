import 'package:equatable/equatable.dart';

class TokenData extends Equatable {
  final String token, loginId;
  final DateTime expiration;

  const TokenData({
    required this.loginId,
    required this.token,
    required this.expiration,
  });

  @override
  List<Object> get props => [
    loginId,
    expiration,
    token,
  ];
}
