// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  String? token;
  dynamic isPhoneVerified;

  LoginResponse({
    this.token,
    this.isPhoneVerified,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    token: json["token"],
    isPhoneVerified: json["is_phone_verified"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "is_phone_verified": isPhoneVerified,
  };
}
