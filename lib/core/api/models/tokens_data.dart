import 'package:invoice_app/features/auth/data/models/responses/login_response_model.dart';


class TokensData {
  String token;

  TokensData(
    this.token,
  );

  factory TokensData.fromLoginResponse(LoginResponse loginResponse) {
    return TokensData(
      loginResponse.result?.token??"",
    );
  }

  @override
  String toString() {
    return token;
  }

  factory TokensData.parse(String value) {
    return TokensData(value);
  }
}
