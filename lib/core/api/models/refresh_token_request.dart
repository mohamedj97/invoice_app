class RefreshTokenRequest {
  late String accessToken;

  late String refreshToken;

  RefreshTokenRequest();

  @override
  String toString() {
    return 'RefreshTokenRequest[accessToken=$accessToken, refreshToken=$refreshToken, ]';
  }

  RefreshTokenRequest.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    return {'accessToken': accessToken, 'refreshToken': refreshToken};
  }

  static List<RefreshTokenRequest> listFromJson(List<dynamic>? json) {
    return json == null
        ? List<RefreshTokenRequest>.empty()
        : json.map((value) => new RefreshTokenRequest.fromJson(value)).toList();
  }

  static Map<String, RefreshTokenRequest> mapFromJson(Map<String, Map<String, dynamic>>? json) {
    var map = new Map<String, RefreshTokenRequest>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) => map[key] = new RefreshTokenRequest.fromJson(value));
    }
    return map;
  }
}
