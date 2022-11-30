import 'package:invoice_app/features/auth/data/models/responses/login_response_model.dart';

class TokensData {
  String token;
  DateTime expiration;

  TokensData(
    this.token,
    this.expiration,
  );

  factory TokensData.fromLoginResponse(LoginResponse loginResponse) {
    return TokensData(
      loginResponse.result?.token ?? "",
      loginResponse.result!.expiration,
    );
  }

  @override
  String toString() {
    return token + "," + expiration.toIso8601String();
  }

  factory TokensData.parse(String value) {
    final parts = value.split(",");
    if (parts.length != 2) {
      throw ("Couldn't decode Tokens Data.");
    }
    return TokensData(
      parts[0],
      DateTime.parse(parts[1]),
    );
  }
}
