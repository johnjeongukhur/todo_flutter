
import 'dart:ffi';

class TodoLoginResponse {
  final int code;
  final String accessToken;
  final String tokenType;

  TodoLoginResponse({required this.code, required this.accessToken, required this.tokenType});

  factory TodoLoginResponse.fromJson(Map<String, dynamic> json) {
    return TodoLoginResponse(
      code: json['code'] ?? 0,
      accessToken: json['access_token'] ?? '',
      tokenType: json['token_type'] ?? '',
    );
  }
}
