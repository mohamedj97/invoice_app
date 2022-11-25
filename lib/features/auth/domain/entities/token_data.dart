import 'package:equatable/equatable.dart';

class TokenData extends Equatable {
  final String token;
  final DateTime expiration;

  const TokenData({
    required this.token,
    required this.expiration,
  });

  @override
  List<Object> get props => [
    expiration,
    token,
  ];
}
